//
//  NetworkRequest.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Foundation

public struct NetworkRequest {
    let url: String
    let headers: [String: String]?
    let body: Data?
    let requestTimeOut: Float?
    let httpMethod: HTTPMethod
    
    public init(
        url: String,
        headers: [String: String]? = nil,
        requestBody: Encodable? = nil,
        requestTimeout: Float? = nil,
        httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.body = requestBody?.encode()
        self.requestTimeOut = requestTimeout
        self.httpMethod = httpMethod
    }
    
    public init(
        url: String,
        headers: [String: String]? = nil,
        requestBody: Data? = nil,
        requestTimeout: Float? = nil,
        httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.body = requestBody
        self.requestTimeOut = requestTimeout
        self.httpMethod = httpMethod
    }
    
    func buildURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        urlRequest.httpBody = body

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
