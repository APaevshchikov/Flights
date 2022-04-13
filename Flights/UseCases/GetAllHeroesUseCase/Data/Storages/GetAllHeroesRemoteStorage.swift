//
//  GetAllHeroesRemoteStorage.swift
//  Flights
//
//  Created by Ars Paev on 13.04.2022.
//

import Foundation
import Combine

final class GetAllHeroesRemoteStorage {
    private let service = NetworkService()
    
    func getAllHeroes() -> AnyPublisher<[HeroDTO], NetworkError> {
        service.getAllHeroes()
            .eraseToAnyPublisher()
    }
}
