//
//  MarvelHeroesApp.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 12/11/23.
//

import SwiftUI

@main
struct MarvelHeroesApp: App {
    // ViewModel Global
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
