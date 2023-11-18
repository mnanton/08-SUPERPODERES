//
//  RootViewModel.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 13/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    // Publicadores
    @Published var status = Status.none
    @Published var heroes: Heroes?
  
    // Suscriptor
    var suscriptors = Set<AnyCancellable>()
    
    func getHeroes(){
        
    }
}
