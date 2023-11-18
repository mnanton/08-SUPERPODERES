//
//  ApiMarvel.swift
//  MarvelHeroes
//
//  Created by Miguel Nantón Díaz on 13/11/23.
//

import Foundation

struct ApiMarvel {
    let tokenPublic: String
    let tokenHash: String
    
    init() {
        if let path = Bundle.main.path(forResource: "config", ofType: "plist"),
           let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any],
           let tokenPublic = dictionary["TokenPublic"] as? String,
           let tokenHash = dictionary["TokenHash"] as? String {
            self.tokenPublic = tokenPublic
            self.tokenHash = tokenHash
        } else {
            self.tokenPublic = ""
            self.tokenHash = ""
            RootViewModel().status = .error(error: "Token no Disponible")
        }
    }
    /*
    func getRequestHeroes() -> URLRequest {
        let urlString = "\(EndPoints.server)\(EndPoints.character)"
        
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: HTTPMethods.headerContent)
        print (request)
        let authorizationHeader = "?apikey=\(tokenPublic)&hash=\(tokenHash)&ts=1"
        request.addValue(authorizationHeader, forHTTPHeaderField: HTTPMethods.headerAuth)
        print(authorizationHeader)
        print(request)
        return request
     // https://gateway.marvel.com/v1/public/characters?apikey=8304a3a9ed0f79d90890452964da38ce&hash=f6616fb76000bbab049d51186f44b9c6&ts=1
     }
    */
    
    
     func getRequestHeroes() -> URLRequest {
         let baseURLString = "\(EndPoints.server)\(EndPoints.character)"
         
         var urlComponents = URLComponents(string: baseURLString)
         var queryItems = [URLQueryItem]()
         queryItems.append(URLQueryItem(name: "apikey", value: tokenPublic))
         queryItems.append(URLQueryItem(name: "hash", value: tokenHash))
         queryItems.append(URLQueryItem(name: "ts", value: "1"))
         urlComponents?.queryItems = queryItems
         
         guard let url = urlComponents?.url else { fatalError("Error: Unable to create URL")}
         
         var request = URLRequest(url: url)
         request.httpMethod = HTTPMethods.get
         request.addValue(HTTPMethods.content, forHTTPHeaderField: HTTPMethods.headerContent)
         
         // Eliminamos la adición del encabezado de autorización aquí
         // request.addValue(authorizationHeader, forHTTPHeaderField: HTTPMethods.headerAuth)
         
         return request
     }
     
}
