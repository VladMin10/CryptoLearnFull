//
//  SettingsView.swift
//  CryptoLearnFull
//
//  Created by Vladyslav Mi on 18.07.2024.
//

import SwiftUI


struct SettingsView: View {
    
    @StateObject private var vm = SettingsViewModel()
    @Binding var showSignInView : Bool
    var body: some View {
        List{
            Button("Log out") {
                Task{
                    do{
                        try vm.signOut()
                        showSignInView = true
                    }catch{
                        print(error)
                    }
                }
            }
            emailSection
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack{
        SettingsView(showSignInView: .constant(false))
    }
    
}

extension SettingsView {
    private var emailSection : some View {
        Section {
            Button("Reset Password") {
                Task{
                    do{
                        try await vm.resetPassword()
                        print("PASSWORD RESET")
                    }catch{
                        print(error)
                    }
                }
            }
            Button("Update Password") {
                Task{
                    do{
                        try await vm.updatePassword()
                        print("PASSWORD UPDATED")
                    }catch{
                        print(error)
                    }
                }
            }
            Button("Update Email") {
                Task{
                    do{
                        try await vm.updateEmail()
                        print("EMAIL UPDATED")
                    }catch{
                        print(error)
                    }
                }
            }
        } header: {
            Text("Email functions")
        }
    }
}
