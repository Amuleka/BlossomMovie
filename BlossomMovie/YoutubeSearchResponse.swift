//
//  YoutubeSearchResponse.swift
//  BlossomMovie
//
//  Created by Amulek Angulo on 10/21/25.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [ItemProperties]?
}

struct ItemProperties: Codable {
    let id: IdProperties?
}

struct IdProperties: Codable {
    let videId: String?
    
}
