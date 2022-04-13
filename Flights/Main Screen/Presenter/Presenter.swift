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

final class Presenter {
    weak var view: ViewInput!
    
    private var getAllHeroesUseCase = GetAllHeroesUseCase()
    private var loadImageUseCase = LoadImageUseCase()
    private var heroesList: [HeroDTO] = []
}

extension Presenter: ViewOutput {
    func viewDidLoad() {
        view.setupView(with: .loadingView)
        getAllHeroesUseCase.getAllHeroes { [weak self] heroes in
            self?.heroesList = heroes
            self?.view.setupView(with: .tableView)
            self?.view.reloadData()
        }
    }
    
    func getNumberOfRows() -> Int {
        return heroesList.count
    }
    
    func getObject(_ indexPath: IndexPath) -> HeroDTO {
        return heroesList[indexPath.row]
    }
    
    func getNavigationBarTitle() -> String {
        return "Flights"
    }
    
    func prefetchRowAt(_ indexPath: IndexPath) {
        let hero = heroesList[indexPath.row]
        loadImageUseCase.loadImageFrom(urlString: hero.image.xs) { [weak view] imageData in
            view?.setImageData(imageData)
        }
    }
}
