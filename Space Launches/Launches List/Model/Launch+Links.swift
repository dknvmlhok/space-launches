//
//  Launch+Links.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

extension Launch {
    
    struct Links: Codable {
        let patch: Patch
        let reddit: Reddit
        let flickr: Flickr
        let presskit: URL?
        let webcast: URL?
        let youtubeId: String?
        let article: URL?
        let wikipedia: URL?
    }
}

extension Launch.Links {

    struct Patch: Codable {
        let small: URL?
        let large: URL?
    }

    struct Reddit: Codable {
        let campaign: URL?
        let launch: URL?
        let media: URL?
        let recovery: URL?
    }

    struct Flickr: Codable {
        let small: [URL]
        let original: [URL]
    }
}

// MARK: - Coding Keys

private extension Launch.Links {

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
