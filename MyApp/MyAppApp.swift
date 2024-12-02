//
//  MyAppApp.swift
//  MyApp
//
//  Created by Hyliard on 26/11/2024.
//

// MyAppApp.swift

import SwiftUI

@main
struct MyAppApp: App {
    @State private var isLoggedIn = false  // Estado para saber si el usuario está logueado
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                dashboardView()  // Si el usuario está logueado, muestra el Dashboard
            } else {
                LoginView()  // Si no está logueado, muestra la vista de Login
            }
        }
    }
}

