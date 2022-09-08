//
//  Presenter.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

class Presenter: PresenterInterface {
    var view: MainViewInterface?
    var interactor: InteractorInterface?
    var wireframe: WireframeInterface?
    var networkService: NetworkServiceInterface?
}
