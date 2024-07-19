//
//  AuthentificationManager.swift
//  CryptoLearnFull
//
//  Created by Vladyslav Mi on 18.07.2024.
//

import Foundation
import FirebaseAuth
import FirebaseAnalytics

struct AuthDataResulModel {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString // .absoluteString для отримання String з URL
    }
}

final class AuthentificationManager {
    static let shared = AuthentificationManager()
    private init() {}
    
    func getAuthentificatedUser() throws -> AuthDataResulModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResulModel(user: user)
    }
    
    @discardableResult
    func createUser(email: String, password: String) async throws ->  AuthDataResulModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResulModel(user: authDataResult.user)
        
    }
    @discardableResult
    func signInUser(email: String, password: String) async throws ->  AuthDataResulModel{
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResulModel(user: authDataResult.user)
    }
    func signOut() throws {
        try Auth.auth().signOut()
    }
    func resetPassword(email : String) async throws{
        try await Auth.auth().sendPasswordReset(withEmail: email)
        
    }
    func updatePassword(password : String) async throws{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        try await user.updatePassword(to: password)
    }
    func updateEmail(email : String) async throws{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        try await user.updateEmail(to: email)
    }
}

