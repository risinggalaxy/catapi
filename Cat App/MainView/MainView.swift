//
//  MainView.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import UIKit

class MainView: VIEW, MainViewInterface {
    
    var presenter: PresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
}
