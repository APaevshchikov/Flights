//
//  Presenter.swift
//  Flights
//
//  Created by Ars Paev on 09.03.2022.
//

import Foundation
import UIKit

enum Content {
    case tableView
    case loadingView
}

final class Presenter: ViewOutput {
    unowned var view: ViewInput!
    var interactor: InteractorInput!
    
    private var videosResponse: [VideoModel] = []
    
    func viewDidLoad() {
        view.setupView(with: .loadingView)
        interactor.getVideos()
    }
    
    func numberOfRows(_ section: Int) -> Int {
        let section = videosResponse[section]
        return section.videos.count
    }
    
    func getVideosCount() -> Int {
        return videosResponse.count
    }
    
    func getSection(_ indexPath: IndexPath) -> VideoModel {
        return videosResponse[indexPath.section]
    }
    
    func titleForHeaderInSection (_ section: Int) -> String {
        return videosResponse[section].sectionName
    }
    
    func getNavigationBarTitle() -> String {
        return "Flights"
    }
}

extension Presenter: InteractorOutput {
    func getVideosSuccess(videos: [VideoModel]) {
        self.videosResponse = videos
        view.setupView(with: .tableView)
        view.reloadData()
    }
    
    func getVideosFail(error: MyCustomError) {
        view.setupView(with: .loadingView)
        videosResponse = []
    }
}
