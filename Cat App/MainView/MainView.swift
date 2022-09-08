//
//  MainView.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import UIKit

class MainView: VIEW, MainViewInterface {
    
    var presenter: PresenterInterface?
    var errorValue: String = ""
    
    var notifierLabel: UILabel! = {
        let size = CGSize(width: 300, height: 100)
        let label = UILabel(frame: CGRect(origin: .zero, size: size))
        label.textColor = UIColor(named: "textColor")
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.isHidden = true
        return label
    }()
    
    var collectionView: UICollectionView! = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: UIScreen.main.bounds,
                                              collectionViewLayout: collectionViewLayout)
        collectionViewLayout.minimumLineSpacing = 10
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.accessibilityLabel = kMainCollectionViewAccessibilityLabel
        return collectionView
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let av = UIActivityIndicatorView(style: .large)
        return av
    }()
    
    let cellWidthCorrection: CGFloat = 100
    let cellIdentifier: String = "CatCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityLabel = kMainView
        view.backgroundColor = UIColor(named: "bgColor")
        view.addSubview(notifierLabel)
        notifierLabel.centerAlignObject(view)
        notifierLabel.accessibilityLabel = kNotifierLabel
        setupCollectionView()
    }
    
    //Receives errors via presenter and displays errors
    func updateViewWhen(_ error: ErrorHandler) {
        if let err = error.errorDescription {
            errorValue = err
        }
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.notifierLabel.isHidden = false
            strongSelf.activityIndicator.isHidden = true
            strongSelf.notifierLabel.text = strongSelf.errorValue
        }
    }
}
