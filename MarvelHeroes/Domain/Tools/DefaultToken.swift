//
//  DefaultToken.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 13/11/23.
//

import Foundation

func defaultToken() {
    
    if let path = Bundle.main.path(forResource: "config", ofType: "plist"),
       let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any],
       let tokenPublic = dictionary["TokenPublic"] as? String,
       let tokenHash = dictionary["TokenHash"] as? String {
        print ("\(tokenPublic),\(tokenHash)")
    }
}
