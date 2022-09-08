//
//  TestModel.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import XCTest
@testable import Cat_App

class TestCatModel: XCTestCase {
    
    var sut: CatModel!
    override func setUp() {
        super.setUp()
        sut = CatModel(id: MockCatModel.id, name: MockCatModel.name,
                       origin: MockCatModel.origin,
                       image: MockCatModel.image)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ModelShouldHaveAnId_WhenReceivedOrCreated() {
        XCTAssertEqual(sut.id, MockCatModel.id)
    }
    
    func test_ModelShouldHaveName_WhenReceivedOrCreated() {
        XCTAssertEqual(sut.name, MockCatModel.name)
    }
    
    func test_ModelShouldHaveAnOrigin_WhenReceivedOrCreated() {
        
        XCTAssertEqual(sut.origin, MockCatModel.origin)
    }
    

    func test_ModelShouldHaveImage_WhenReceivedOrCreated() {
        XCTAssertEqual(sut.image.url, MockCatModel.image.url)
    }
    
    
}
