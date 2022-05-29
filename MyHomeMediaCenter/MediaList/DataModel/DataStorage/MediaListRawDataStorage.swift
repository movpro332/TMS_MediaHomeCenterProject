//
//  MediaListDataStorage.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 18.05.2022.
//

import Foundation
import UIKit



struct MediaList {
    let mediaCover: UIImage
    let mediaName: String
    let mediaAuthor: String
}

struct MediaRawDataModel {
    let rawMediaType: String
    var rawMedia: [MediaList]
}

struct MediaListStorage {
    private(set) var mediaItemsModels: [MediaRawDataModel]
}
