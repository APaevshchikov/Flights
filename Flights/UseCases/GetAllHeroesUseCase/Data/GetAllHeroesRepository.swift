//
//  GetAllHeroesRepository.swift
//  Flights
//
//  Created by Ars Paev on 13.04.2022.
//

import Foundation
import Combine

final class GetAllHeroesRepository: GetAllHeroesRepositoryable {
    private let remoteStorage = GetAllHeroesRemoteStorage()
    private let localStorage = GetAllHeroesLocalStorage()
    
    func getAllHeroes(from storage: Storage) -> AnyPublisher<[HeroDTO], NetworkError> {
        switch storage {
        case .remote:
           return remoteStorage.getAllHeroes()
                .eraseToAnyPublisher()
        case .local:
           return localStorage.getAllHeroes()
                .collect()
                .eraseToAnyPublisher()
        }
    }
}
