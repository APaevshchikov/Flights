import XCTest
@testable import Flights

class FlightsTests: XCTestCase {
    var interactor: InteractorInput!
    var presenter: Presenter!
    var view: ViewInput!
    var networkService: NetworkService!
    var loadImageUseCase: LoadImageUseCase!

    override func setUp() {
        super.setUp()
        
        loadImageUseCase = LoadImageUseCase()
        networkService = NetworkService()
        interactor = Interactor(networkService: networkService)
        presenter = Presenter()
        view = ViewController()
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.loadImageUseCase = loadImageUseCase
        interactor.output = presenter
    }

    override func tearDown() {
        loadImageUseCase = nil
        networkService = nil
        interactor = nil
        presenter = nil
        view = nil
        
        super.tearDown()
    }

    func test_setHeroesListIsNotEmpryIfSuccess() throws {
        interactor.output?.getAllHeroesSuccess(
            heroes: [
                HeroDTO.mockHeroDTO
            ]
        )
        
        XCTAssertNotEqual(presenter.getNumberOfRows(), 0)
        XCTAssertEqual(presenter.getNumberOfRows(), 1)
    }
    
    func test_setHeroesListIsEmpryIfFail() throws {
        interactor.output?.getAllHeroesFail(error: .apiError)
        XCTAssertEqual(presenter.getNumberOfRows(), 0)
    }
    
    func test_load123() throws {
        let expectation = expectation(description: #function)
        var expectedValue = 2155
        
        loadImageUseCase.loadImageFrom(
            urlString: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/xs/1-a-bomb.jpg",
            completion: { imageData in
                expectation.fulfill()
                expectedValue = imageData.count
            }
        )
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertEqual(expectedValue, 2155)
    }
}
