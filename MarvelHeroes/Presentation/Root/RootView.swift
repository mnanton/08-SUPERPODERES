//
//  RootView.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 14/11/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status {
        case .none:
            MainView()
        case .loaded:
            MainView()
        case .loading:
            LoadingView()
        case .error(error: let errorString):
         ErrorView(error: errorString)
        }
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
