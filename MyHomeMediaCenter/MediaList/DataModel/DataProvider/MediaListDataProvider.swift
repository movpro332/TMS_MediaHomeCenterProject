//
//  MediaListDataProvider.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 18.05.2022.
//

import Foundation
import UIKit

class MediaListDataProvider {
    
    private let obtainer: MediaListDataObtainer
    private var dataModel: LibraryDataModel
    
    init(obtainer: MediaListDataObtainer) {
        self.obtainer = obtainer
        dataModel = self.obtainer.obtainMedia()
    }
    
    var mediaItemsCount: Int {
        dataModel.libraryItems.count
        
    }
    
    func getMedia(withIndexPath indexPath: IndexPath) -> Media {
        dataModel.libraryItems[indexPath.section].media[indexPath.row]
    }

    func header(forSection section: Int) -> String {
        dataModel.libraryItems[section].mediaType
    }
    
    func mediaCount(forSection sectionNumber: Int) -> Int {
        dataModel.libraryItems[sectionNumber].media.count
    }
    
    func addItem() {
        dataModel.libraryItems[0].media.insert(.init(mediaCover: UIImage(named: "direstraits")!, mediaName: "Dire Straits", mediaAuthor: "Dire Straits"), at: 0)
    }
    
    func deleteItem() {
        if dataModel.libraryItems.count != 0 {
        dataModel.libraryItems[0].media.removeLast()
        }
    }
}
