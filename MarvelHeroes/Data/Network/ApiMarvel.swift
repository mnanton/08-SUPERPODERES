//
//  ApiMarvel.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 13/11/23.
//

import Foundation

struct ApiMarvel {
    func getListCharacters()-> URLRequest{
        let urlString = "\(EndPoints.server)\(EndPoints.character)"
        
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
}
