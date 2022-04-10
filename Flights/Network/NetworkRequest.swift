//
//  NetworkRequest.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Foundation

public struct NetworkRequest {
    let url: URL?
    let headers: [String: String]?
    let body: Data?
    let httpMethod: HTTPMethod
    
    public init(
        url: URL?,
        headers: [String: String]? = nil,
        requestBody: Encodable? = nil,
        httpMethod: HTTPMethod = .GET
    ) {
        self.url = url
        self.headers = headers
        self.body = requestBody?.encode()
        self.httpMethod = httpMethod
    }
    
    public init(
        url: URL?,
        headers: [String: String]? = nil,
        requestBody: Data? = nil,
        httpMethod: HTTPMethod = .GET
    ) {
        self.url = url
        self.headers = headers
        self.body = requestBody
        self.httpMethod = httpMethod
    }
    
    func buildURLRequest(
        with url: URL,
        httpMethod: HTTPMethod = .GET,
        headers: [String: String] = [:],
        httpBody: Data? = nil
    ) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = httpBody

        return urlRequest
    }
}

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public enum NetworkError: Error, Equatable {
    case badURL
    case apiError
    case invalidJSON
    case unauthorized
    case badRequest
    case serverError
    case noResponse
    case unableToParseData
    case unknown
}

extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}
