//
//  NtworkService.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

class NetworkService: NetworkServiceInterface {
    
    var urlSession: URLSession
    var url: String
    
    required init(urlSession: URLSession = .shared, url: String) {
        self.urlSession = urlSession
        self.url = url
    }
    
    func downloader(completionHandler: @escaping (Data?, ErrorHandler?) -> Void) {
        guard let urlString = URL(string: self.url) else {
            completionHandler(nil, .failedToLoadURL)
            return
        }
        let task = self.urlSession.dataTask(with: urlString) { (data, _, error )in
            if let _ = error {
                completionHandler(nil, .failedDueToCorruptData)
            }
            
            if let receivedData = data  {
                completionHandler(receivedData, nil)
            }
        }
        task.resume()
    }
}
