//
//  UITestMainView.swift
//  CatAppUITests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import XCTest

class CatAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    var mainCollectionView: XCUIElement!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        mainCollectionView = app.collectionViews["MainCollectionView"]
        app.launch()
        
    }
    
    override func tearDown() {
        app = nil
        mainCollectionView = nil
        super.tearDown()
    }
    
    func testMainCollectionViewIsEnabled_ShouldReturnTrue() {
        XCTAssertTrue(mainCollectionView.isEnabled)
    }
    
    func testMainCollectionViewTextLabel_ShouldHaveAValue() {
        let textLabel = mainCollectionView.staticTexts.firstMatch
        XCTAssertNotNil(textLabel)
    }
    
}
