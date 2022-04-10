import Foundation
import Combine

class Interactor {
    weak var output: InteractorOutput?
    
    let networkService: NetworkServiceable
    
    private var cancellable = Set<AnyCancellable>()
    
    init(networkService: NetworkServiceable) {
        self.networkService = networkService
    }
    
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
    func getAllHeroes() {
        networkService.getAllHeroes()
            .subscribe(on: DispatchQueue.global(qos: .utility))
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak output] in
                    switch $0 {
                    case .finished:
                        break
                    case .failure(let error):
                        output?.getAllHeroesFail(error: error)
                    }
                },
                receiveValue: { [weak output] model in
                    print(model)
                    output?.getAllHeroesSuccess(heroes: model)
                }
            )
            .store(in: &cancellable)
    }
}
