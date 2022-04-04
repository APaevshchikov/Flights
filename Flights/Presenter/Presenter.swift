//
//  Presenter.swift
//  Flights
//
//  Created by Ars Paev on 09.03.2022.
//

import Foundation
import UIKit

final class Presenter: ViewOutput {
    private var videos: [VideoModel] = []
    
    weak var view: ViewInput!
    var interactor: InteractorInput!
    
    func viewDidLoad() {
        interactor.getVideos()
    }
    
    func numberOfRows(_ section: Int) -> Int {
        let section = videos[section]
        return section.videos.count
    }
    
    func getVideosCount() -> Int {
        videos.count
    }
    
    func getSection(_ indexPath: IndexPath) -> VideoModel {
        videos[indexPath.section]
    }
    
    func titleForHeaderInSection (_ section: Int) -> String {
        videos[section].sectionName
    }
}

extension Presenter: InteractorOutput {
    func getVideosSuccess(videos: [VideoModel]) {
        self.videos = videos
        view.reloadData()
    }
    
    func getVideosFail(error: MyCustomError) {
        videos = []
    }
}
