//
//  Launch+Links.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

// MARK: - Domain Object

extension Launch {
    
    struct Links {
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

    struct Patch {
        let small: URL?
        let large: URL?
    }

    struct Reddit {
        let campaign: URL?
        let launch: URL?
        let media: URL?
        let recovery: URL?
    }

    struct Flickr {
        let small: [URL]
        let original: [URL]
    }
}

// MARK: - Domain Object Maping

extension LaunchDTO.LinksDTO {

    var mapToDomain: Launch.Links {
        .init(
            patch: patch.mapToDomain,
            reddit: reddit.mapToDomain,
            flickr: flickr.mapToDomain,
            presskit: presskit,
            webcast: webcast,
            youtubeId: youtubeId,
            article: article,
            wikipedia: wikipedia
        )
    }
}

extension LaunchDTO.LinksDTO.PatchDTO {

    var mapToDomain: Launch.Links.Patch {
        .init(
            small: small,
            large: large
        )
    }
}

extension LaunchDTO.LinksDTO.RedditDTO {

    var mapToDomain: Launch.Links.Reddit {
        .init(
            campaign: campaign,
            launch: launch,
            media: media,
            recovery: recovery
        )
    }
}

extension LaunchDTO.LinksDTO.FlickrDTO {

    var mapToDomain: Launch.Links.Flickr {
        .init(
            small: small,
            original: original
        )
    }
}
