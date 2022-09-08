//
//  AppConstants.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

struct APIURL {
    static let urlComponent = URLComponents(string: "https://api.thecatapi.com/v1/breeds/?limit=30")
    public static func getURL() -> String {
        guard let str = urlComponent?.string else { return "\(ErrorHandler.failedToLoadURL)"}
        return str
    }
}

public let kMainTitleFont: String = "Avenir Next Heavy"
public let kMainCollectionViewAccessibilityLabel = "MainCollectionView"
public let kMainCollectionViewCellAccessibilityLabel = "MainCellLabel"
public let kMainView = "MainView"
public let kNotifierLabel = "NotifierLabel"
