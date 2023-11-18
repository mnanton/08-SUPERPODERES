//
//  MainView.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 14/11/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationStack {
            List{
                if let heros = viewModel.hero{
                    ForEach(heros){ data in
                        NavigationLink {
                            //Destino
                           // HeroesDetailView(hero: data)
                        } label: {
                            //La celda personalizada
                            CellView(hero: data)
                                .frame(height: 200)
                        }
                    }
                }
            }
            .navigationTitle("Marvel Heroes")
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel(testing: true))
}
