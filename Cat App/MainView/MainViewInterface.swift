//
//  MainViewInteractor.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import UIKit

protocol MainViewInterface {
    var presenter: PresenterInterface? { get set }
    var collectionView: UICollectionView! { get set }
    var notifierLabel: UILabel! { get }
    func updateViewWhen( _ error: ErrorHandler)
}
