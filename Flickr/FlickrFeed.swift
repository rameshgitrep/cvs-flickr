//
//  FlickrFeed.swift
//  Flickr
//
//  Created by Ramesh Maddali on 7/1/24.
//

import Foundation

struct FlickrFeed: Decodable {
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [FlickrItem]
    
    struct FlickrItem: Decodable, Identifiable {
        let id = UUID()
        let title: String
        let link: String
        let media: Media
        let date_taken: String
        let description: String
        let published: String
        let author: String
        let author_id: String
        let tags: String
        
        struct Media: Codable {
            let m: String
        }
    }
}
