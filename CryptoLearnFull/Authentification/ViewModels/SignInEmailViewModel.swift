//
//  SignInEmailViewModel.swift
//  CryptoLearnFull
//
//  Created by Vladyslav Mi on 19.07.2024.
//

import Foundation

final class SignInEmailViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUp()async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthentificationManager.shared.createUser(email: email, password: password)
        
    }
    
    func signIn()async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthentificationManager.shared.signInUser(email: email, password: password)
        
    }
}
