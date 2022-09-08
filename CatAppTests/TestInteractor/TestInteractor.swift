//
//  TestInteractor.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import XCTest
@testable import Cat_App

class TestInteractor: XCTestCase {
    
    var sut: Interactor!
    var mockPresenter: MockPresenter!
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        sut = Interactor()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        mockNetworkService = MockNetworkService(urlSession:session, url: "")
        mockPresenter = MockPresenter()
        
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testInteractor_WhenPresenterWantsNewObject_ShouldProvideObjectForIndex() {
        let indexPath = IndexPath(row: 0, section: 0)
        sut.catObjects = MockCatObjects.catObjects()
        let cat = sut.objectFor(indexPath.row)
        XCTAssertEqual(cat?.name, MockCatObjects.catObjects()[0].name)
    }
    
    
}
