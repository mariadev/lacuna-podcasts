//
//  Episode.swift
//  LacunaPodcasts
//
//  Created by Priscilla Ip on 2020-06-30.
//  Copyright © 2020 Priscilla Ip. All rights reserved.
//

import Foundation
import FeedKit

enum DownloadStatus: String, Codable {
    case none
    case inProgress
    case completed
    case failed
}

struct Episode: Codable {
    
    var collectionId: Int
    
    let title: String
    let pubDate: Date
    let description: String
    let author: String
    let duration: Double
    let streamUrl: String
    
    var fileUrl: String?
    var imageUrl: String?
    
    
    
    var isDownloaded: Bool = false
    var downloadStatus: DownloadStatus = .none
    
    init(feedItem: RSSFeedItem) {
        
        
        
        self.collectionId = 0
        
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.description ?? ""
        self.author = feedItem.iTunes?.iTunesAuthor ?? ""
        self.duration = feedItem.iTunes?.iTunesDuration ?? 0
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
        self.streamUrl = feedItem.enclosure?.attributes?.url ?? ""
    }
    
}
