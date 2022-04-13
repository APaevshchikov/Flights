//
//  GetAllHeroesRepositoryable.swift
//  Flights
//
//  Created by Ars Paev on 13.04.2022.
//

import Foundation
import Combine

enum Storage {
    case remote
    case local
}

protocol GetAllHeroesRepositoryable {
    func getAllHeroes(from storage: Storage) -> AnyPublisher<[HeroDTO], NetworkError>
}
