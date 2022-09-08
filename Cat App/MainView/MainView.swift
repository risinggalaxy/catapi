//
//  MainView.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import UIKit

class MainView: VIEW, MainViewInterface {
    
    var presenter: PresenterInterface?
    var collectionView: UICollectionView!
    var notifierLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    
    func updateViewWhen(_ error: ErrorHandler) {
        //TODO: UPDATE notifierLabel
    }
    
}
