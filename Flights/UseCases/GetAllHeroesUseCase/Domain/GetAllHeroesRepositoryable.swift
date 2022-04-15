//
//  GetAllHeroesRepositoryable.swift
//  Flights
//
//  Created by Ars Paev on 13.04.2022.
//

import Foundation
import Combine

enum Storage {
    case remoteStorage
    case localStorage
}

protocol GetAllHeroesRepositoryable {
    func getAllHeroes(from storage: Storage) -> AnyPublisher<[HeroDTO], NetworkError>
}
