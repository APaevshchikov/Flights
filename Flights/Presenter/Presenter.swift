//
//  Presenter.swift
//  Flights
//
//  Created by Ars Paev on 09.03.2022.
//

import Foundation

enum Content {
    case tableView
    case loadingView
}

final class Presenter: ViewOutput {
    unowned var view: ViewInput!
    var interactor: InteractorInput!
    
    private var heroesResponse: [HeroDTO] = []
    
    func viewDidLoad() {
        view.setupView(with: .loadingView)
        interactor.getAllHeroes()
    }
    
    func getNumberOfRows() -> Int {
        return heroesResponse.count
    }
    
    func getObject(_ indexPath: IndexPath) -> HeroDTO {
        return heroesResponse[indexPath.row]
    }
    
    func getNavigationBarTitle() -> String {
        return "Flights"
    }
    
    func prefetchRowAt(_ indexPath: IndexPath) {
        let hero = heroesResponse[indexPath.row]
        interactor.getHeroImage(for: hero)
    }
}

extension Presenter: InteractorOutput {
    func getHeroImageSuccess(imageData: Data) {
        view.setImageData(imageData)
    }
    
    func getHeroImageFail(error: NetworkError) {
        view.setImagePlaceholder(name: "person.fill.xmark")
    }
    
    func getAllHeroesSuccess(heroes: [HeroDTO]) {
        heroesResponse = heroes
        view.setupView(with: .tableView)
        view.reloadData()
    }
    
    func getAllHeroesFail(error: NetworkError) {
        view.setupView(with: .loadingView)
        heroesResponse = []
    }
}
