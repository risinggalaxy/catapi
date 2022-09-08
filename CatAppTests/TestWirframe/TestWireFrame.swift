//
//  TestWireFrame.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import XCTest
@testable import Cat_App

class TestWireframe: XCTestCase {
    
    func testWireframe_WhenLaunchingApp_ShouldInitializeFirstView() {
        let view = Wireframe.createInitialView()
        XCTAssertTrue(view.title != nil)
        XCTAssertEqual(view.title, "Home")
    }
    
}
