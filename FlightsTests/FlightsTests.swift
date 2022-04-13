import XCTest
@testable import Flights

import Combine

class FlightsTests: XCTestCase {
    var loadImageUseCase: LoadImageUseCase!
    var getAllHeroesUseCase: GetAllHeroesUseCase!
    
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        
        getAllHeroesUseCase = GetAllHeroesUseCase()
        loadImageUseCase = LoadImageUseCase()
    }

    override func tearDown() {
        getAllHeroesUseCase = nil
        loadImageUseCase = nil
        
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
        
        getAllHeroesUseCase.getAllHeroes(from: .local)
            .sink(
                receiveCompletion: { _ in
                    expectation.fulfill()
                },
                receiveValue: { heroes in
                    expectedList = heroes
                }
            )
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(expectedList.count, 1)
        XCTAssertEqual(expectedList.first!.id, 1)
        XCTAssertEqual(expectedList.first!.name, "X")
    }
}
