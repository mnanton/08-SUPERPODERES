//
//  ApiMarvelModel.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 13/11/23.
//

import Foundation

struct HTTPMethods {
    static let get = "GET"
    static let content = "application/json"
    static let headerContent = "Content-type"
    static let headerAuth = "Authorization"
}

struct EndPoints {
    static let server = "https://gateway.marvel.com"
    static let character = "/v1/public/characters"

}
