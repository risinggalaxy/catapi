//
//  MockNetworkService.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation
@testable import Cat_App

class MockNetworkService: NetworkServiceInterface {
    
    var urlSession: URLSession
    var url: String
    
    var didCallDownloader: Bool = false
    var timesDidCallDownloader: Int = 0
    
    required init(urlSession: URLSession, url: String) {
        self.urlSession = urlSession
        self.url = url
    }
    
    func downloader(completionHandler: @escaping (Data?, ErrorHandler?) -> Void) {
        didCallDownloader = true
        timesDidCallDownloader += 1
    }
    
    
}
