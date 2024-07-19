//
//  CryptoLearnFullApp.swift
//  CryptoLearnFull
//
//  Created by Vladyslav Mi on 15.07.2024.
//

import SwiftUI
import Firebase


@main
struct CryptoLearnFullApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                RootView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
