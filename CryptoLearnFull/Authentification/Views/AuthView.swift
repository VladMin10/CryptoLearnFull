//
//  AuthView.swift
//  CryptoLearnFull
//
//  Created by Vladyslav Mi on 18.07.2024.
//

import SwiftUI

struct AuthView: View {
    
    @Binding var showSignInView : Bool
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack{
                
                NavigationLink {
                    SignInEmailView(showSignInView: $showSignInView)
                } label: {
                    Text("Sign in with Email")
                        .foregroundColor(.black)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                Spacer()
                
            }
            .padding()
            .navigationTitle("Sign In")
        }
    }
}

#Preview {
    NavigationStack {
        AuthView(showSignInView: .constant(true))
            .preferredColorScheme(.dark)
    }
}
