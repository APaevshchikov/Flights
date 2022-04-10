import Foundation

protocol InteractorInput: AnyObject {
    var output: InteractorOutput? { get set }
    
    func getVideos()
    func getAllHeroes()
}
