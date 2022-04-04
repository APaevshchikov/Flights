import Foundation

protocol InteractorOutput: AnyObject {
    func getVideosSuccess(videos: [VideoModel])
    func getVideosFail(error: MyCustomError)
}
