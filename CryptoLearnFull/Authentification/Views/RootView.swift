//
//  RootView.swift
//  CryptoLearnFull
//
//  Created by Vladyslav Mi on 18.07.2024.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView : Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack{
                SettingsView(showSignInView: $showSignInView)
            }
            .onAppear{
                let authUser = try? AuthentificationManager.shared.getAuthentificatedUser()
                self.showSignInView = authUser == nil
            }
            .fullScreenCover(isPresented: $showSignInView) {
                NavigationStack{
                    AuthView(showSignInView: $showSignInView)
                }
            }
        }
    }
}

#Preview {
    RootView()
}
