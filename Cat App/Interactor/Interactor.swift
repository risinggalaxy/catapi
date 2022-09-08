//
//  Interactor.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

class Interactor: InteractorInterface {
    
    var presenter: PresenterInterface?
    
    var networkService: NetworkServiceInterface? {
        didSet {
            if let ns = networkService{
                ns.downloader { [weak self] data, error in
                    guard let strongSelf = self else { return }
                    if let err = error {
                        strongSelf.presenter?.updateView(err)
                    }
                    guard let receivedData = data else {
                        strongSelf.presenter?.updateView(.failedDueToCorruptData)
                        return
                    }
                    let decoder = JSONDecoder()
                    do {
                        //By shuffling the list users wont get bored with the same results every time they ope the app
                        strongSelf.catObjects = try decoder.decode([CatModel].self, from: receivedData).shuffled()
                    } catch let err {
                        strongSelf.presenter?.updateView(.failedRequest(description: err.localizedDescription))
                    }
                }
            }
        }
    }
    
    //Stores catObjects sends an update of the object count to the presenter
    var catObjects: [CatModel]? {
        didSet {
            guard let cats = catObjects else {
                presenter?.updateView(.failedToLoadCats)
                return
            }
            cats.count > 1 ? presenter?.numberOfObjects = cats.count :
            presenter?.updateView(.emptyCollection)
        }
    }
    
    //Returns a catObject for a given index, the object is sent to the Presenter
    func objectFor(_ index: Int) -> CatModel? {
        return catObjects?[index] != nil ? catObjects![index] : nil
    }
    
}
