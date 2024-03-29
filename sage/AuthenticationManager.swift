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
    @Environment(\.presentationMode) var presentationMode
    
    var completion: (Result<AuthDataResult, Error>) -> Void
    
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
    
    func signInWithGithub() {
        // Start the sign-in process
        let provider = OAuthProvider(providerID: "github.com")
        provider.scopes = ["user:email"] // Add additional scopes if needed
        provider.customParameters = ["allow_signup": "false"]
        
        provider.getCredentialWith(nil) { credential, error in
            if let error = error {
                self.completion(.failure(error))
                return
            }
            
            if let credential = credential {
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error = error {
                        self.completion(.failure(error))
                    } else if let authResult = authResult {
                        self.completion(.success(authResult))
                    }
                    
                    // Dismiss the view controller after sign-in
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    func signInWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Update to IOS 15:
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let rootViewController = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
                return
            }

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

