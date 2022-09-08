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
    var numberOfObjects: Int? { get set }
    func objectFor(index: Int) -> CatModel?
    func updateView( _ error: ErrorHandler)
    func imageForCell(with url: String?, name: String,  urlSession: URLSession, completion: @escaping (Data?, ErrorHandler?) -> Void )
}
