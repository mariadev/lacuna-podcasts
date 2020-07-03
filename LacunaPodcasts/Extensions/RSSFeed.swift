//
//  RSSFeed.swift
//  LacunaPodcasts
//
//  Created by Priscilla Ip on 2020-07-01.
//  Copyright © 2020 Priscilla Ip. All rights reserved.
//

import FeedKit

extension RSSFeed {
    
    func toEpisodes() -> [Episode] {
        
        var episodes = [Episode]()
        
        let imageUrl = iTunes?.iTunesImage?.attributes?.href
        
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)
            
            if episode.imageUrl == nil {
                episode.imageUrl = imageUrl
            }
            
            episodes.append(episode)
        })
        return episodes
    }
    
    func toPodcast() -> Podcast {
        
        var podcast = Podcast()
        
        podcast.trackName = title
        podcast.artistName = iTunes?.iTunesAuthor
        podcast.artworkUrl600 = iTunes?.iTunesImage?.attributes?.href
        podcast.description = description?.stripOutHtml()
        podcast.link = link
        return podcast
    }
    
}
