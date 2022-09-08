//
//  PresenterInterFace.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

protocol PresenterInterface {
    var view: MainViewInterface? { get set }
    var interactor: InteractorInterface? { get set }
    var wireframe: WireframeInterface? { get set }
    var networkService: NetworkServiceInterface? { get set }
}
