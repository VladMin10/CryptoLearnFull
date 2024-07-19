//
//  SignInEmailView.swift
//  CryptoLearnFull
//
//  Created by Vladyslav Mi on 18.07.2024.
//

import SwiftUI
import Firebase

struct SignInEmailView: View {
    
    @StateObject private var vm = SignInEmailViewModel()
    @Binding var showSignInView : Bool
    
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            VStack{
                VStack {
                    TextField("Email", text: $vm.email)
                        .foregroundColor(.backgroundR)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(15)
                    TextField("Password", text: $vm.password)
                        .foregroundColor(.backgroundR)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(15)
                }
                .padding(.vertical, 10)
                
                
                Button {
                    Task{
                        do{
                            try await vm.signUp()
                            showSignInView = false
                            return
                        } catch{
                            print(error)
                        }
                        
                        do{
                            try await vm.signIn()
                            showSignInView = false
                            return
                        } catch{
                            print(error)
                        }
                    }
                    
                }  label: {
                    Text("Sign In")
                        .foregroundColor(.black)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(20)
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        SignInEmailView(showSignInView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
