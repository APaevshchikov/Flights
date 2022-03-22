//
//  Presenter.swift
//  Flights
//
//  Created by Ars Paev on 09.03.2022.
//

import Foundation
import UIKit

final class Presenter: ViewOutput {
    private var videos: [Video] = []
    
    weak var view: ViewInput!
    var interactor: InteractorInput!
    
    func viewDidLoad() {
        interactor.getVideos()
    }
    
    func numberOfRows() -> Int {
        videos.count
    }
    
    func getVideos() -> [Video] {
        videos
    }
}

extension Presenter: InteractorOutput {
    func getVideosSuccess(videos: [Video]) {
        self.videos = videos
        view.reloadData()
    }
    
    func getVideosError(error: Error) {
        videos = []
    }
    
    
}
