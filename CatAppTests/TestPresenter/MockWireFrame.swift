//
//  MockWireFrame.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation
@testable import Cat_App
import UIKit

class MockWireframe: WireframeInterface {
    
    static func createInitialView() -> VIEW {
        let view = UIViewController()
        view.title = "TEST HOME"
        return view
    }
    
}
