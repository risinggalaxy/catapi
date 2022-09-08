//
//  MockView.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import UIKit
@testable import Cat_App

class MockMainView: MainViewInterface {
    var collectionView: UICollectionView!
    var notifierLabel: UILabel!
    var presenter: PresenterInterface?
    var didUpdateNotifierLabelWithError: Bool =  false
    var timesDidUpdateNotifierLabel: Int = 0
    var errorType: ErrorHandler = .noValidImageUrl
    
    func updateViewWhen(_ error: ErrorHandler) {
        didUpdateNotifierLabelWithError = true
        timesDidUpdateNotifierLabel += 1
        errorType = error
    }
}
