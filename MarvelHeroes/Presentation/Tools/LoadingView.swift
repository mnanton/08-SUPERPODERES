//
//  LoadingView.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 14/11/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Image(decorative: "Marvel3")
                .resizable()
                .opacity(0.6)
            Spacer()
            VStack{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(CGSize(width: 12, height: 12))
                    
                Text ("Por favor espere ...")
                    .font(.title)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.top, 380)
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    LoadingView()
}
