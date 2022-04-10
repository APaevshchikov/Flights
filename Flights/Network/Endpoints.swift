//
//  Endpoints.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Foundation

public typealias Headers = [String: String]

enum Endpoints {
    case getAll
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getAll:
            return .GET
        }
    }
    
    func createRequest(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        return NetworkRequest(
            url: getURL(from: environment),
            headers: headers,
            requestBody: nil,
            httpMethod: httpMethod
        )
    }
    
    func getURL(from environment: Environment) -> String {
        let baseUrl = environment.baseUrl
        switch self {
        case .getAll:
            return "\(baseUrl)/all.json"
        }
    }
}
