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
    var numberOfObjects: Int? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.view?.collectionView.reloadData()
            }
        }
    }
    
    func objectFor(index: Int) -> CatModel? {
        guard let catObject = interactor?.objectFor(index) else  {
            view?.updateViewWhen(.cannotFindObject)
            return nil
        }
        return catObject
    }
    
    func updateView(_ error: ErrorHandler) {
        view?.updateViewWhen(error)
    }
    
    func imageForCell(with url: String?, name: String, urlSession: URLSession, completion: @escaping (Data?, ErrorHandler?) -> Void) {
        guard let imageUrl = url else {
            updateView(.noValidImageUrl)
            completion(nil, .noValidImageUrl)
            return
        }
        if CacheService.imageExists(fileName: name, in: .cache).available {
            guard let cacheImage = CacheService.imageExists(fileName: name, in: .cache).imageData else {
                updateView(.cachedImageDatWasCorrupt)
                completion(nil, .cachedImageDatWasCorrupt)
                return
            }
            //Sending cached image to the collection view cell, instead of downloading it again, saving resources
            completion(cacheImage, nil)
            //Otherwise we are going to download the image and store it in cache folder
        } else {
            networkService = NetworkService(urlSession: urlSession ,url: imageUrl)
            networkService?.downloader(completionHandler: { [weak self] (data, error) in
                guard let strongSelf = self else { return }
                if let err = error {
                    strongSelf.updateView(err)
                    completion(nil, err)
                }
                
                //Downloading imageData and saving it in cache folder for reuse
                if let imageData = data {
                    CacheService.saveImage(fileName: name, imageData: imageData, in: .cache)
                    completion(imageData, nil)
                }
            })
        }
    }
    
}
