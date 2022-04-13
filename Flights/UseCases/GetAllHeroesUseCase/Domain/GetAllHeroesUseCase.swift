import Foundation
import Combine

class GetAllHeroesUseCase {
    private let repository: GetAllHeroesRepositoryable = GetAllHeroesRepository()
    
    func getAllHeroes(from storage: Storage) -> AnyPublisher<[HeroDTO], NetworkError> {
        repository.getAllHeroes(from: storage)
            .eraseToAnyPublisher()
    }
}
