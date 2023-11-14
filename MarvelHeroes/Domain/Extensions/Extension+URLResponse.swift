//
//  Extension+URLResponse.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 14/11/23.
//

import Foundation

extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
