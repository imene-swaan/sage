//
//  AuthenticationManager.swift
//  sage
//
//  Created by Aymane Hachcham on 12/01/2024.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
import FirebaseCore

enum AuthState {
    case authenticated // Anonymously authenticated in Firebase.
    case signedIn // Authenticated in Firebase using one of service providers, and not anonymous.
    case signedOut // Not authenticated in Firebase.
}

class AuthenticationManager: ObservableObject {
    @Published var user: User?
    @Published var authState = AuthState.signedOut
    
    /// 1.
    private var authStateHandle: AuthStateDidChangeListenerHandle!

    init() {
        // 3.
        configureAuthStateChanges()
    }

    // 2.
    func configureAuthStateChanges() {
        authStateHandle = Auth.auth().addStateDidChangeListener { auth, user in
            print("Auth changed: \(user != nil)")
            Task {
                await self.updateState(user: user)
            }
        }
    }

    // 2.
    func removeAuthStateListener() {
        Auth.auth().removeStateDidChangeListener(authStateHandle)
    }

    // 4.
    func updateState(user: User?) async {
        await MainActor.run {
            self.user = user
            let isAuthenticatedUser = user != nil
            let isAnonymous = user?.isAnonymous ?? false

            if isAuthenticatedUser {
                self.authState = isAnonymous ? .authenticated : .signedIn
            } else {
                self.authState = .signedOut
            }
        }
    }
    
    func signInWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Assuming you have a UIWindow to present the view controller
        if let window = UIApplication.shared.windows.first,
           let rootViewController = window.rootViewController {
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [weak self] result, error in
                guard error == nil else {
                    // Handle error
                    return
                }
                guard let user = result?.user,
                      let idToken = user.idToken?.tokenString else {
                    // Handle error
                    return
                }
                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: user.accessToken.tokenString)
                // Handle the Firebase sign-in with credential
                self?.signInWithFirebase(credential: credential)
            }
        }
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }

    private func signInWithFirebase(credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { authResult, error in
            if error != nil {
                // Handle error
                return
            }
            // User is signed in
    
        }
    }
}

