import XCTest
@testable import Flights

class FlightsTests: XCTestCase {
    var presenter: Presenter!
    var view: ViewInput!
    var networkService: NetworkService!
    var loadImageUseCase: LoadImageUseCase!
    var getAllHeroesUseCase: GetAllHeroesUseCase!

    override func setUp() {
        super.setUp()
        
        getAllHeroesUseCase = GetAllHeroesUseCase()
        loadImageUseCase = LoadImageUseCase()
        networkService = NetworkService()
        presenter = Presenter()
        view = ViewController()
        view.output = presenter
        presenter.view = view
    }

    override func tearDown() {
        getAllHeroesUseCase = nil
        loadImageUseCase = nil
        networkService = nil
        presenter = nil
        view = nil
        
        super.tearDown()
    }
    
    func test_loadImageUseCaseLoadImageFromUrlString() throws {
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
    
    func test_getAllHeroesUseCaseGetAllHeroes() throws {
        let expectation = expectation(description: #function)
        var expectedList: [HeroDTO] = []
        
        getAllHeroesUseCase.getAllHeroes { heroes in
            expectation.fulfill()
            expectedList = heroes
        }
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(expectedList, [])
    }
}
