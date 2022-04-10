import Foundation

protocol InteractorOutput: AnyObject {
    func getVideosSuccess(videos: [VideoModel])
    func getVideosFail(error: MyCustomError)
    
    func getAllHeroesSuccess(heroes: [HeroDTO])
    func getAllHeroesFail(error: NetworkError)
}
