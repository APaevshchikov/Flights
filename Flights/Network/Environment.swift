//
//  Environment.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Foundation

public enum Environment: String, CaseIterable {
    case baseHeroUrl
}

extension Environment {
    var baseUrl: String {
        switch self {
        case .baseHeroUrl:
            return "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api"
        }
    }
}
