import Foundation
import UIKit

class Interactor {
    weak var output: InteractorOutput?
    var fakeFlag: Bool = false
    
    private func setupVideos(
        success: ([VideoModel]) -> Void,
        fail: (MyCustomError) -> Void
    ) {
        if let results = DataSourceManager.videoModels(fakeFlag: fakeFlag) {
            success(results)
        } else {
            fail(.dontCare)
        }
    }
}

extension Interactor: InteractorInput {
    func getVideos() {
        setupVideos(
            success: { videos in
                output?.getVideosSuccess(videos: videos)
            },
            fail: { error in
                output?.getVideosFail(error: error)
            }
        )
    }
}
