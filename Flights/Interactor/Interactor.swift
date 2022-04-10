import Foundation
import Combine

class Interactor {
    weak var output: InteractorOutput?
    
    private var cancellable = Set<AnyCancellable>()
    
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
    
    func getAllHeroes() {
        let request: Requestable = NativeRequestable()
        let service: PurchaseServiceable = PurchaseService(networkRequest: request, environment: .baseHeroUrl)
        service.getAllHeroes()
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
