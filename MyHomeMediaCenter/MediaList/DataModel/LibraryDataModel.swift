//
//  MediaListDataModel.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 16.05.2022.
//

import Foundation
import UIKit

struct LibraryDataModel {
    var libraryItems: [MediaDataItemModel]
}

struct MediaDataItemModel {
    let mediaType: String
    var media: [Media]
}

struct Media {
    let mediaCover: UIImage
    let mediaName: String
    let mediaAuthor: String
}
