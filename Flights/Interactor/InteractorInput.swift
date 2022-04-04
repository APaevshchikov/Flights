import Foundation

protocol InteractorInput: AnyObject {
    var output: InteractorOutput? { get set }
    var fakeFlag: Bool { get set }
    
    func getVideos()
}
