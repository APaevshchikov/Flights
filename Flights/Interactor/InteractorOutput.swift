import Foundation

protocol InteractorOutput: AnyObject {
    func getAllHeroesSuccess(heroes: [HeroDTO])
    func getAllHeroesFail(error: NetworkError)
}
