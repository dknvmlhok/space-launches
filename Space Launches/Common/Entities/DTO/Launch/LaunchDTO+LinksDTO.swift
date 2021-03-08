//
//  LaunchDTO+LinksDTO.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 24.02.2021.
//

import Foundation

// MARK: - Data Objects

extension LaunchDTO {
    
    struct LinksDTO: Decodable {
        let patch: PatchDTO
        let reddit: RedditDTO
        let flickr: FlickrDTO
        let presskit: URL?
        let webcast: URL?
        let youtubeId: String?
        let article: URL?
        let wikipedia: URL?
    }
}

extension LaunchDTO.LinksDTO {
    
    struct PatchDTO: Decodable {
        let small: URL?
        let large: URL?
    }
    
    struct RedditDTO: Decodable {
        let campaign: URL?
        let launch: URL?
        let media: URL?
        let recovery: URL?
    }
    
    struct FlickrDTO: Decodable {
        let small: [URL]
        let original: [URL]
    }
}

// MARK: - Coding Keys

private extension LaunchDTO.LinksDTO {
    
    enum CodingKeys: String, CodingKey {
        case patch
        case reddit
        case flickr
        case presskit
        case webcast
        case youtubeId = "youtube_id"
        case article
        case wikipedia
    }
}
