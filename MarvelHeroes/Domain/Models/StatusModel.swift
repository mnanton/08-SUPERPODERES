//
//  StatusModel.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 13/11/23.
//

import Foundation

enum Status {
    case none
    case loading
    case loaded
    case error (error: String)
}
