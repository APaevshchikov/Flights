//
//  GetAllHeroesLocalStorage.swift
//  Flights
//
//  Created by Ars Paev on 13.04.2022.
//

import Foundation
import Combine

final class GetAllHeroesLocalStorage {
    private var mockList: [HeroDTO] = [
        HeroDTO(
            id: 1,
            name: "X",
            image: HeroDTOImage(
                xs: "",
                sm: "",
                md: "",
                lg: ""
            )
        )
    ]
    
    func getAllHeroes() -> AnyPublisher<HeroDTO, NetworkError> {
        Future { [weak self] promise in
            guard let hero = self?.mockList.first else {
                return promise(.failure(.noResponse))
            }
            return promise(.success(hero))
        }
        .eraseToAnyPublisher()
    }
}
