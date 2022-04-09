import Foundation
import UIKit

class Interactor {
    weak var output: InteractorOutput?
    
    private func setupVideos(
        success: @escaping ([VideoModel]) -> Void,
        fail: @escaping (MyCustomError) -> Void
    ) {
        DispatchQueue.global(qos: .utility).async {
            if let results = DataSourceManager.videoModels() {
                DispatchQueue.main.async {
                    success(results)
                }
            } else {
                DispatchQueue.main.async {
                    fail(.dontCare)
                }
            }
        }
    }
}

extension Interactor: InteractorInput {
    func getVideos() {
        setupVideos(
            success: { [weak output] videos in
                output?.getVideosSuccess(videos: videos)
            },
            fail: { [weak output] error in
                output?.getVideosFail(error: error)
            }
        )
    }
}
