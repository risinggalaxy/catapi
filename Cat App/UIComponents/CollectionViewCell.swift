//
//  CollectionViewCell.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var mainImage: Data? {
        didSet {
            if let mainImageData = mainImage {
                imageView.image = UIImage(data: mainImageData)
                isLoadingObject = false
            }
        }
    }

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: kMainTitleFont, size: 35)
        label.numberOfLines = .zero
        label.textColor = .white
        return label
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(frame: .zero)
        ai.style = .large
        ai.isHidden = true
        return ai
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        addViews()
    }
    
    private func addViews() {
        self.accessibilityLabel = kMainCollectionViewCellAccessibilityLabel
        self.clipsToBounds = true
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(activityIndicator)
        imageView.autoLayoutHelper((anchor: self.leadingAnchor, constant: .zero),
                                   (anchor: self.trailingAnchor, constant: .zero),
                                   (anchor: self.topAnchor, constant: .zero),
                                   (anchor: self.bottomAnchor, constant: .zero), setSize: false)
  
        
        titleLabel.autoLayoutHelper((anchor: self.leadingAnchor, constant: 25),
                                    (anchor: self.trailingAnchor, constant: -25),
                                    nil,
                                    (anchor: self.bottomAnchor, constant: -50), setSize: false)
        
        activityIndicator.centerAlignObject(imageView)
        isLoadingObject = true
    }

    var catObject: CatModel? {
        didSet {
            guard let cat = catObject else { return }
            titleLabel.text = cat.name.uppercased()
        }
    }
    
    var isLoadingObject: Bool? {
        didSet {
            if let newValue = isLoadingObject {
                activityIndicator.isHidden = newValue ? false : true
                if newValue {
                    activityIndicator.startAnimating()
                } else {
                    activityIndicator.stopAnimating()
                }
            }
        }
    }
}

