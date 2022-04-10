//
//  URLBuilder.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Foundation

final class URLBuilder {
    private enum Components: String {
        case scheme = "https"
        case host = "akabab.github.io"
        case path = "/superhero-api/api/"
    }
    
    func buildURL(path: String, queryItems: [String: String] = [:]) -> URL? {
        var components = URLComponents()
        
        components.scheme = Components.scheme.rawValue
        components.host = Components.host.rawValue
        components.path = Components.path.rawValue + "\(path)" + ".json"
        
        components.queryItems = queryItems.map { URLQueryItem(name: $0.0, value: $0.1) }
        
        return components.url
    }
}
