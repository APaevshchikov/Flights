//
//  InteractorOutput.swift
//  Flights
//
//  Created by Ars Paev on 19.03.2022.
//

import Foundation

protocol InteractorOutput: AnyObject {
    func getVideosSuccess(videos: [Video])
    func getVideosError(error: Error)
}
