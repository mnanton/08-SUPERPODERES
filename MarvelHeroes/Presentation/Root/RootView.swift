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
            withAnimation{
               MainView(viewModel: MainViewModel())
            }
        case .loaded:
            withAnimation{
                MainView(viewModel: MainViewModel())
            }
        case .loading:
            withAnimation{
                LoadingView()
            }
        case .error(error: let errorString):
            withAnimation{
                ErrorView(error: errorString)
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
