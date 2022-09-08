//
//  MockInteractor.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation
@testable import Cat_App

class MockInteractor: InteractorInterface {
    
   
    
    var presenter: PresenterInterface?
    
    var didSetNetworkService: Bool = false
    var timesDidSetNetworkService: Int = 0
    
    var didReturnCatObjectForIndex: Bool = false
    var timesReturnedCatObjectsForIndex: Int = 0
    
    var networkService: NetworkServiceInterface? {
        didSet {
            didSetNetworkService = true
            timesDidSetNetworkService += 1
        }
    }
    
    func objectFor(_ index: Int) -> CatModel? {
        didReturnCatObjectForIndex = true
        timesReturnedCatObjectsForIndex += 1
        return MockCatObjects.catObjects()[index]
    }
    
    var catObjects: [CatModel]? = {
        return MockCatObjects.catObjects()
    }()
}
