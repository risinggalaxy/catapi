//
//  TestPresenter.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import XCTest
@testable import Cat_App

class TestPresenter: XCTestCase {
    
    var sut: Presenter!
    var mockInteractor: MockInteractor!
    var mockMainView: MockMainView!
    var mockWireframe: MockWireframe!
    
    override func setUp() {
        super.setUp()
        sut = Presenter()
        mockInteractor = MockInteractor()
        mockMainView = MockMainView()
        mockWireframe = MockWireframe()
        sut.interactor = mockInteractor
        sut.view = mockMainView
        sut.wireframe = mockWireframe
    }
    
    override func tearDown() {
        sut = nil
        mockInteractor = nil
        mockMainView = nil
        mockWireframe = nil
        super.tearDown()
    }
    
    func testPresenter_WhenRequestingObjectFor_ShouldNotBeNil() {
        let request = sut.objectFor(index: 1)
        XCTAssertNotNil(request)
        XCTAssertTrue(mockInteractor.didReturnCatObjectForIndex)
        XCTAssertEqual(mockInteractor.timesReturnedCatObjectsForIndex, 1)
    }
    
    
    func testPresenter_WhenErrorOccurs_ShouldUpdateView() {
        sut.updateView(.failedDueToCorruptData)
        let errorType = ErrorHandler.failedDueToCorruptData
        XCTAssertTrue(mockMainView.didUpdateNotifierLabelWithError)
        XCTAssertEqual(mockMainView.timesDidUpdateNotifierLabel, 1)
        XCTAssertEqual(mockMainView.errorType, errorType)
    }
    
    
    func testPresenter_ImageForCell_ShouldDownloadImageData() {
        let expectation = XCTestExpectation(description: "Data Passed")
        guard let imageData = UIImage(named: "catImage")?.pngData() else { return }
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        MockURLProtocol.stubData = imageData
        let urlSession = URLSession(configuration: configuration)
        sut.imageForCell(with: "dummyCatImage", name: "dummyCatImage", urlSession: urlSession) { receivedData in
            XCTAssertEqual(receivedData, imageData)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    
}
