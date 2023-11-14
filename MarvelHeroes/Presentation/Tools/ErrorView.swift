//
//  ErrorView.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 14/11/23.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    private var stringError: String
    
    init(error: String) {
        self.stringError = error
    }
    
    var body: some View {
        ZStack{
            Image(decorative: "Marvel3")
                .resizable()
                .opacity(0.9)
            Spacer()
            VStack{
                Image(systemName: "nosign")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 180, height: 180)
                
                Text ("\(stringError)")
                    .font(.title)
                    .foregroundStyle(.red)
                    .bold()
                    .padding(.top, 350)
                
                Button(action: {
                    rootViewModel.status = .none
                }, label: {
                    Text("CONTINUAR")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                        .bold()
                        .frame(width: 250, height: 50)
                        .background(.red)
                        .cornerRadius(15)
                        .padding()
                    
                })
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ErrorView(error: "Mensaje de error")
        .environmentObject(RootViewModel())
}
