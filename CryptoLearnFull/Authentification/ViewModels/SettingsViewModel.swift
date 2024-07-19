//
//  SettingsViewModel.swift
//  CryptoLearnFull
//
//  Created by Vladyslav Mi on 19.07.2024.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject{
    
    func signOut()throws {
        try AuthentificationManager.shared.signOut()
    }
    func resetPassword() async throws {
        let authUser = try AuthentificationManager.shared.getAuthentificatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthentificationManager.shared.resetPassword(email: email)
    }
    func updateEmail() async throws{
        let email = "me@gmail.com"
        try await AuthentificationManager.shared.updateEmail(email: email)
    }
    func updatePassword() async throws{
        let password = "123456"
        try await AuthentificationManager.shared.updatePassword(password: password)
    }

}
