//
//  NativeRequestable.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Combine
import Foundation

public protocol Requestable {
    func request<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError>
}

public class NativeRequestable: Requestable {
    public func request<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError> {
        guard
            let url = URL(string: request.url)
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
