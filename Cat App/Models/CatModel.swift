//
//  CatModel.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

struct CatModel: Codable {
    let id, name, origin: String
    let image: ImageModel
}

struct ImageModel: Codable { let url: String }

