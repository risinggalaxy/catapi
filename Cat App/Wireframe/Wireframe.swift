//
//  Wireframe.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

class Wireframe: WireframeInterface {
    
    static func createInitialView() -> VIEW {
        let mainView = MainView()
        let interactor = Interactor()
        let presenter = Presenter()
        let wireframe = Wireframe()
        
        mainView.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = mainView
        presenter.wireframe = wireframe
        mainView.title = "Home"
        
        return mainView
    }
    
}
