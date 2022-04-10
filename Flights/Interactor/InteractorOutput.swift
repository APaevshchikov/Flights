import Foundation

protocol InteractorOutput: AnyObject {
    func getAllHeroesSuccess(heroes: [HeroDTO])
    func getAllHeroesFail(error: NetworkError)
    
    func getHeroImageSuccess(imageData: Data)
    func getHeroImageFail(error: NetworkError)
}
