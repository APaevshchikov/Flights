//
//  FlightsTests.swift
//  FlightsTests
//
//  Created by Ars Paev on 07.03.2022.
//

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
        presenter.viewDidLoad()
        XCTAssertFalse(presenter.getVideos().isEmpty)
    }
    
    func test_setVideos() throws {
        presenter.viewDidLoad()
        
        XCTAssertTrue(presenter.numberOfRows() == 10)
    }
    
    func test_empty() {
        XCTAssertTrue(presenter.getVideos().isEmpty)
    }
}
