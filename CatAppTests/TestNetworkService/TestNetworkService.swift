//
//  TestNetworkService.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import XCTest
@testable import Cat_App

class TestNetworkService: XCTestCase {
    
    var sut: NetworkService!
    var session: URLSession!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: configuration)
    }
    
    override func tearDown() {
        sut = nil
        session = nil
        MockURLProtocol.stubData = nil
        MockURLProtocol.error = nil
        super.tearDown()
    }
    
    func testNetworkService_WhenDataReceived_ShouldPassTest() {
        let expectation = expectation(description: "Data Received")
        sut = NetworkService(urlSession: session, url: "https://risinggalaxy.com")
        MockURLProtocol.stubData = mockJSON
        sut.downloader { data, error in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testNetworkService_WhenAnEmptyStringIsGiven_AnErrorShouldOccur(){
        let expectation = expectation(description: "An Empty String Was Provided")
        sut = NetworkService(url: "")
        sut.downloader { data, error in
            XCTAssertEqual(error, .failedToLoadURL)
            XCTAssertNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testNetworkService_WhenAnBadStringIsGiven_AnErrorShouldOccur(){
        let expectation = expectation(description: "A Bad URL Was Given")
        sut = NetworkService(urlSession: session, url: "http://m")
        MockURLProtocol.error = .failedDueToCorruptData
        sut.downloader { data, error in
            XCTAssertEqual(error, .failedDueToCorruptData)
            XCTAssertNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        
    }
    
    func testNetworkService_IntegrationTest_WhenRequestingData_ShouldPass(){
        let expectation = expectation(description: "Integration Test Passed")
        sut = NetworkService(url: "https://api.thecatapi.com/v1/breeds/?limit=30")
        sut.downloader { data, error in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
        
    }
}

