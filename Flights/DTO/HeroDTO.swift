//
//  HeroDTO.swift
//  Flights
//
//  Created by Ars Paev on 10.04.2022.
//

import Foundation

struct HeroDTO: Codable {
    let id: Int
    let name: String
    let image: HeroDTOImage
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image = "images"
    }
}

struct HeroDTOImage: Codable {
    let xs: String
    let sm: String
    let md: String
    let lg: String
}
