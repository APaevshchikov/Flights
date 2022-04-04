import XCTest
@testable import Flights

class FlightsTests: XCTestCase {
    var interactor: InteractorInput!
    var presenter: Presenter!
    var view: ViewInput!

    override func setUp() {
        super.setUp()
        
        interactor = Interactor()
        interactor.fakeFlag = false
        presenter = Presenter()
        view = ViewController()
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
    }

    override func tearDown() {
        interactor = nil
        presenter = nil
        view = nil
        
        super.tearDown()
    }

    func testExample() throws {
        presenter.viewDidLoad()
        XCTAssertNotEqual(presenter.getVideosCount(), 0)
    }
    
    func test_setVideos() throws {
        // given
        let sectionNumber = 0
        
        // when
        presenter.viewDidLoad()
        
        // then
        XCTAssertEqual(presenter.numberOfRows(sectionNumber), 3)
    }
    
    func test_empty() {
        interactor.fakeFlag = true
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(presenter.getVideosCount(), 0)
    }
}
