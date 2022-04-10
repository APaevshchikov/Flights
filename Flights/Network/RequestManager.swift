//
//  RequestManager.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Combine
import Foundation

public protocol Requestable {
    func makeRequest<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError>
}

public class RequestManager: Requestable {
    public func makeRequest<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError> {
        guard
            let url = request.url
        else {
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.badURL)
            )
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: request.buildURLRequest(with: url))
            .tryMap { output in
                guard
                    output.response is HTTPURLResponse
                else {
                    throw NetworkError.serverError
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.invalidJSON
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
