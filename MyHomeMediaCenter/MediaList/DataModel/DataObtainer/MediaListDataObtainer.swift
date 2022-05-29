//
//  MediaListDataObtainer.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 18.05.2022.
//

import Foundation

struct MediaListDataObtainer {
    
    private let dataStorage: MediaListStorage
    
    init(dataStorage: MediaListStorage) {
        self.dataStorage = dataStorage
    }
    
    func obtainMedia() -> LibraryDataModel {
        var mediaItems: [MediaDataItemModel] = []
        
        for mediaItem in dataStorage.mediaItemsModels {
            
            
            let item = MediaDataItemModel(
                mediaType: mediaItem.rawMediaType,
                media: mediaItem.rawMedia.compactMap { transform(mediaRawItem: $0) }
            )
            
            mediaItems.append(item)
            
        }
        
        return LibraryDataModel(libraryItems: mediaItems)
    }
    
    
    func transform(mediaRawItem: MediaList) -> Media {
        return Media(
            mediaCover: mediaRawItem.mediaCover,
            mediaName: mediaRawItem.mediaName,
            mediaAuthor: mediaRawItem.mediaAuthor
        )
    }
    
    
    
}
