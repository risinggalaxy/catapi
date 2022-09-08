//
//  MockCatObjects.swift
//  CatAppTests
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation
@testable import Cat_App
class MockCatObjects {
    static func catObjects() -> [CatModel] {
        var catModels: [CatModel] = []
        for i in 0...10 {
            let cat = CatModel(id: "Cat\(i)", name: "Name\(i)", origin: "From\(i)", image: ImageModel(url: "Image\(i)"))
            catModels.append(cat)
        }
        return catModels
    }
}
