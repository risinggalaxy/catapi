//
//  NetworkSerivceInterface.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

protocol NetworkServiceInterface {
    var urlSession: URLSession { get set }
    var url: String { get set }
    init(urlSession: URLSession, url: String)
    func downloader(completionHandler: @escaping (Data?, ErrorHandler?) -> Void )
}
