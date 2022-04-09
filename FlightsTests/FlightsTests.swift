import XCTest
@testable import Flights

class FlightsTests: XCTestCase {
    var interactor: InteractorInput!
    var presenter: Presenter!
    var view: ViewInput!

    override func setUp() {
        super.setUp()
        
        interactor = Interactor()
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
        interactor.output?.getVideosSuccess(videos: DataSourceManager.videoModels()!)
        XCTAssertNotEqual(presenter.getVideosCount(), 0)
    }
    
    func test_setVideos() throws {
        // given
        let sectionNumber = 0
        
        // when
        interactor.output?.getVideosSuccess(videos: DataSourceManager.videoModels()!)
        
        // then
        XCTAssertEqual(presenter.numberOfRows(sectionNumber), 3)
    }
}
