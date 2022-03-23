//
//  Interactor.swift
//  Flights
//
//  Created by Ars Paev on 19.03.2022.
//

import Foundation
import UIKit

class Interactor {
    weak var output: InteractorOutput?
}

extension Interactor: InteractorInput {
    func getVideos() {
        let v1 = Video(image: UIImage(systemName: "video")!, title: "v1 title")
        let v2 = Video(image: UIImage(systemName: "video")!, title: "v2 title")
        let v3 = Video(image: UIImage(systemName: "video")!, title: "v3 title")
        let v4 = Video(image: UIImage(systemName: "video")!, title: "v4 title")
        let v5 = Video(image: UIImage(systemName: "video")!, title: "v5 title")
        let v6 = Video(image: UIImage(systemName: "video")!, title: "v6 title")
        let v7 = Video(image: UIImage(systemName: "video")!, title: "v7 title")
        let v8 = Video(image: UIImage(systemName: "video")!, title: "v8 title")
        let v9 = Video(image: UIImage(systemName: "video")!, title: "v9 title")
        let v10 = Video(image: UIImage(systemName: "video")!, title: "v10 title")
        
        let videoModel1 = VideoModel(sectionName: "1sec", videos: [v1, v2, v3])
        let videoModel2 = VideoModel(sectionName: "2sec", videos: [v4, v5, v6])
        let videoModel3 = VideoModel(sectionName: "", videos: [v7, v8, v9, v10])
        let videoModel4 = VideoModel(sectionName: "4sec", videos: [v2, v4, v6, v8])
        
        output?.getVideosSuccess(videos: [videoModel1, videoModel2, videoModel3, videoModel4])
    }
    
    
}
