//
//  ErrorHandler.swift
//  Cat App
//
//  Created by YASSER FARAHI on 08/09/2022.
//

import Foundation

enum ErrorHandler: Equatable, LocalizedError {
    case failedToParsJSON,
    failedDueToCorruptData,
    failedToLoadURL,
    noValidImageUrl,
    failedToLoadCats,
    emptyCollection,
    cannotFindObject,
    cachedImageDatWasCorrupt,
    failedRequest(description: String)
    public var errorDescription: String? {
        switch self {
        case .failedToParsJSON: return "App failed to load JSON data".capitalized
        case .failedDueToCorruptData: return "Failed due to receiving bad data".capitalized
        case .failedToLoadURL: return "failed to load url".capitalized
        case .noValidImageUrl: return "we couldn't find an image".capitalized
        case .failedToLoadCats: return "failed to load cats".capitalized
        case .emptyCollection: return "cat collection seems to be empty".capitalized
        case .cannotFindObject: return "we can not find a cat at this time".capitalized
        case .cachedImageDatWasCorrupt: return "cached image was somehow damaged".capitalized
        case .failedRequest(description: let description): return description
        }
    }
}
