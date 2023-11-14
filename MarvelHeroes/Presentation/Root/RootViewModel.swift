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
  
    // Suscriptor
    var suscriptors = Set<AnyCancellable>()
    
    
    
}
