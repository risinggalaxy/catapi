//
//  MainViewExtension.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import UIKit

extension MainView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if presenter?.numberOfObjects != nil {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            return (presenter?.numberOfObjects)!
        } else {
            collectionView.addSubview(activityIndicator)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            activityIndicator.centerAlignObject(collectionView)
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        if cell.tag != indexPath.row {
            cell.imageView.image = nil
        }
        cell.tag = indexPath.row
        cell.isLoadingObject = true
        if let cat = presenter?.objectFor(index: indexPath.row) {
            cell.catObject = cat
            presenter?.imageForCell(with: cat.image.url, name: cat.name, urlSession: .shared, completion: { (imageData, _)  in
                DispatchQueue.main.async {
                    cell.mainImage = imageData
                    cell.isLoadingObject = false
                }
            })
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - cellWidthCorrection , height: view.frame.height - 150)
    }
}

