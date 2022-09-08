//
//  TestAPIURLScheme.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import XCTest
@testable import Cat_App

class TestAPIURLScheme: XCTestCase {
    
    func testAPIUrlScheme_WhenGettingURL_ShouldPass() {
        let url = APIURL.getURL()
        guard let scheme = APIURL.urlComponent?.scheme else { fatalError("Failed to get scheme")}
        guard let path = APIURL.urlComponent?.path else { fatalError("Failed to get path") }
        guard let host = APIURL.urlComponent?.host else { fatalError("Failed to get host") }
        guard let query = APIURL.urlComponent?.query else { fatalError("Failed to get query") }
        
        let schemeExpected = "https"
        let pathExpected = "/v1/breeds/"
        let hostExpected = "api.thecatapi.com"
        let queryExpected = "limit=30"
        let urlExpected = "https://api.thecatapi.com/v1/breeds/?limit=30"
        
        XCTAssertEqual(scheme, schemeExpected)
        XCTAssertEqual(path, pathExpected)
        XCTAssertEqual(host, hostExpected)
        XCTAssertEqual(query, queryExpected)
        XCTAssertEqual(url, urlExpected)
    }
 
}
