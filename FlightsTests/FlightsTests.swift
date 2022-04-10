import XCTest
@testable import Flights

class FlightsTests: XCTestCase {
    var interactor: InteractorInput!
    var presenter: Presenter!
    var view: ViewInput!
    var networkService: NetworkService!

    override func setUp() {
        super.setUp()
        
        networkService = NetworkService()
        interactor = Interactor(networkService: networkService)
        presenter = Presenter()
        view = ViewController()
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
    }

    override func tearDown() {
        networkService = nil
        interactor = nil
        presenter = nil
        view = nil
        
        super.tearDown()
    }

    func test_setHeroesListIsNotEmpryIfSuccess() throws {
        interactor.output?.getAllHeroesSuccess(heroes: [HeroDTO(id: 1, name: "")])
        XCTAssertNotEqual(presenter.getNumberOfRows(), 0)
        XCTAssertEqual(presenter.getNumberOfRows(), 1)
    }
    
    func test_setHeroesListIsEmpryIfFail() throws {
        interactor.output?.getAllHeroesFail(error: .apiError)
        XCTAssertEqual(presenter.getNumberOfRows(), 0)
    }
}
