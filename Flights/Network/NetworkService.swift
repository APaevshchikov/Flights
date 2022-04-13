//
//  NetworkService.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Combine
import Foundation

protocol NetworkServiceable {
    func getAllHeroes() -> AnyPublisher<[HeroDTO], NetworkError>
    func loadImageFrom(urlString: String) -> AnyPublisher<Data, NetworkError>
}

final class NetworkService {
    private let requestManager: Requestable = RequestManager()
    private let urlBuilder: URLBuilder = URLBuilder()
}

extension NetworkService: NetworkServiceable {
    func getAllHeroes() -> AnyPublisher<[HeroDTO], NetworkError> {
        let url = urlBuilder.buildURL(path: "all")
        let request: NetworkRequest = NetworkRequest(url: url)
        
        return requestManager.makeRequest(request)
            .eraseToAnyPublisher()
    }
    
    func loadImageFrom(urlString: String) -> AnyPublisher<Data, NetworkError> {
        let url = URL(string: urlString)
        let request: NetworkRequest = NetworkRequest(url: url)
        
        return requestManager.makeImageRequest(request)
            .eraseToAnyPublisher()
    }
}
