import Foundation
import Combine

class GetAllHeroesUseCase {
    private let service = NetworkService()
    private var cancellables: Set<AnyCancellable> = []
    
    func getAllHeroes(completion: @escaping ([HeroDTO]) -> Void) {
        service.getAllHeroes()
            .sink(
                receiveCompletion: { _ in
                    
                },
                receiveValue: { model in
                    completion(model)
                }
            )
            .store(in: &cancellables)
    }
}
