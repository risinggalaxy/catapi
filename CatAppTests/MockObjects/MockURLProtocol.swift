//
//  MockURLProtocol.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import UIKit
@testable import Cat_App

class MockURLProtocol: URLProtocol {
    
    public static var stubData: Data?
    public static var error: ErrorHandler?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let err = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: err)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
    }
    
}
