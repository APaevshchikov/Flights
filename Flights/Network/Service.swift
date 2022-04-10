//
//  Service.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Combine

protocol PurchaseServiceable {
    func getAllHeroes() -> AnyPublisher<[HeroDTO], NetworkError>
}

class PurchaseService: PurchaseServiceable {
    
    private var networkRequest: Requestable
    private var environment: Environment
    
    init(networkRequest: Requestable, environment: Environment) {
        self.networkRequest = networkRequest
        self.environment = environment
    }
    
    func getAllHeroes() -> AnyPublisher<[HeroDTO], NetworkError> {
        let endpoint = Endpoints.getAll
        let request = endpoint.createRequest(environment: .baseHeroUrl)
        return networkRequest.request(request)
    }
}

public struct HeroDTO: Codable {
    public let id: Int
    public let name: String
}
