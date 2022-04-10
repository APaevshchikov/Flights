//
//  NetworkService.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Combine

protocol NetworkServiceable {
    func getAllHeroes() -> AnyPublisher<[HeroDTO], NetworkError>
}

final class NetworkService {
    let requestManager: Requestable = RequestManager()
}

extension NetworkService: NetworkServiceable {
    func getAllHeroes() -> AnyPublisher<[HeroDTO], NetworkError> {
        let url = URLBuilder().buildURL(path: "all")
        let request: NetworkRequest = NetworkRequest(url: url)
        
        return requestManager.makeRequest(request)
            .eraseToAnyPublisher()
    }
}
