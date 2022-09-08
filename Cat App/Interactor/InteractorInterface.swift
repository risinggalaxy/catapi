//
//  InteractorInterface.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

protocol InteractorInterface {
    var presenter: PresenterInterface? { get set }
    var networkService: NetworkServiceInterface? { get set }
    var catObjects: [CatModel]? { get set }
    func objectFor(_ index: Int) -> CatModel?
}
