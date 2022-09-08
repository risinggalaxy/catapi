//
//  TestMainView.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import XCTest
@testable import Cat_App

class TestMainVIew: XCTestCase {
    
    var sut: MainView!
    var mockPresenter: MockPresenter!
    
    override func setUp() {
        super.setUp()
        sut = MainView()
        mockPresenter = MockPresenter()
        mockPresenter.view = sut
        sut.presenter = mockPresenter
        
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        super.tearDown()
    }
    
    func testMainViewShouldUpdateErroValue_WhenErrorIsPassed() {
        XCTAssertTrue(sut.errorValue == "")
        mockPresenter.updateView(.failedDueToCorruptData)
        XCTAssertTrue(mockPresenter.didUpdateViewWithError)
        XCTAssertEqual(mockPresenter.timesDidUpdateViewWithError, 1)
        XCTAssertEqual(sut.errorValue, ErrorHandler.failedDueToCorruptData.errorDescription)
    }
    
    func testMainView_CheckCellIdentifier_ShouldPass() {
        let cellIdentifier = "CatCell"
        XCTAssertEqual(sut.cellIdentifier, cellIdentifier)
    }
    
    
    func testMainView_CellWidthCorrection_ShouldBeEqualToGivenValue() {
        let cellWidthCorrection = CGFloat(100)
        XCTAssertEqual(sut.cellWidthCorrection, cellWidthCorrection)
    }
    
    func testMainView_MainViewBackground_ShouldBeEqualToGivenValue() {
        let backgroundColor = UIColor(named: "bgColor")
        XCTAssertEqual(sut.view.backgroundColor, backgroundColor)
    }
    
    
}
