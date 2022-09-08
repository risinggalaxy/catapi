//
//  MockPresenter.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation
@testable import Cat_App

class MockPresenter: PresenterInterface {
    
    var view: MainViewInterface?
    var interactor: InteractorInterface?
    var wireframe: WireframeInterface?
    var networkService: NetworkServiceInterface?
    var numberOfObjects: Int? = 100
    
    var didUpdateViewWithError: Bool = false
    var timesDidUpdateViewWithError: Int = 0
    var didCallImageForCell: Bool = false
    var timesDidCallImageForCell: Int = 0
    
    func objectFor(index: Int) -> CatModel? {
        let catModel = CatModel(id: "One", name: "Two", origin: "Three", image: ImageModel(url: "Four"))
        return catModel
    }
    
    func updateView(_ error: ErrorHandler) {
        didUpdateViewWithError = true
        timesDidUpdateViewWithError += 1
    }
    
    func imageForCell(with url: String?, name: String, urlSession: URLSession, completion: @escaping (Data) -> Void) {
        didCallImageForCell = true
        timesDidCallImageForCell += 1
    }
    
    
}
