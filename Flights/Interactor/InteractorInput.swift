//
//  InteractorInput.swift
//  Flights
//
//  Created by Ars Paev on 19.03.2022.
//

import Foundation

protocol InteractorInput: AnyObject {
    var output: InteractorOutput? { get set }
    
    func getVideos()
}
