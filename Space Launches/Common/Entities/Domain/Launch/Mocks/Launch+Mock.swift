//
//  Launch+Mock.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

extension Launch {

    static let mock = Launch(
        fairings: Fairings(
            reused: true,
            recoveryAttempt: true,
            recovered: true,
            ships: [
                "5ea6ed2e080df4000697c907",
                "5ea6ed2e080df4000697c908"
            ]
        ),
        links: Links(
            patch: Links.Patch(
                small: URL(string: "https://imgur.com/BrW201S.png"),
                large: URL(string: "https://imgur.com/573IfGk.png")
            ),
            reddit: Links.Reddit(
                campaign: URL(string: "https://www.reddit.com/r/spacex/comments/i63bst/starlink_general_discussion_and_deployment_thread/"),
                launch: URL(string: "https://www.reddit.com/r/spacex/comments/iu0vtg/rspacex_starlink12_official_launch_discussion/"),
                media: URL(string: "https://www.reddit.com/r/spacex/comments/iudifm/rspacex_starlink12_media_thread_photographer/"),
                recovery: URL(string: "https://www.reddit.com/r/spacex/comments/k2ts1q/rspacex_fleet_updates_discussion_thread/")
            ),
            flickr: Links.Flickr(
                small: [URL](),
                original: [
                    URL(string: "https://live.staticflickr.com/65535/50428228397_6151927733_o.jpg")!,
                    URL(string: "https://live.staticflickr.com/65535/50427359318_67b3397892_o.jpg")!,
                    URL(string: "https://live.staticflickr.com/65535/50428050591_36defbe958_o.jpg")!
                ]
            ),
            presskit: URL(string: "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-21_mision_overview_high_res.pdf"),
            webcast: URL(string: "https://youtu.be/UZkaE_9zwQQ"),
            youtubeId: "UZkaE_9zwQQ",
            article: URL(string: "https://spaceflightnow.com/2020/10/24/spacex-adds-another-60-satellites-to-starlink-network/"),
            wikipedia: URL(string: "https://en.wikipedia.org/wiki/Starlink")
        ),
        staticFireDateUTC: "2020-10-17T05:23:00.000Z",
        staticFireDateUnix: 1602912180,
        tbd: false,
        net: false,
        window: 17820,
        rocket: "5e9d0d95eda69973a809d1ec",
        success: true,
        failures: [
            Failures(
                time: 301,
                altitude: 289,
                reason: "harmonic oscillation leading to premature engine shutdown"
            ),
            Failures(
                time: 33,
                altitude: nil,
                reason: "merlin engine failure"
            )
        ],
        details: "Ratsat was carried to orbit on the first successful orbital launch of any privately funded and developed, liquid-propelled carrier rocket, the SpaceX Falcon 1",
        crew: [
            "5ebf1b7323a9a60006e03a7b",
            "5ebf1a6e23a9a60006e03a7a"
        ],
        ships: [
            "5ea6ed30080df4000697c913",
            "5ea6ed2f080df4000697c90b",
            "5ea6ed2f080df4000697c90c",
            "5ea6ed2e080df4000697c909",
            "5ea6ed2f080df4000697c90d"
        ],
        capsules: [
            "5e9e2c5cf3591885d43b266d"
        ],
        payloads: [
            "5eb0e4c7b6c3bb0006eeb224",
            "5eb0e4c8b6c3bb0006eeb225"
        ],
        launchpad: "5e9e4502f509092b78566f87",
        autoUpdate: true,
        launchLibraryId: "f31702e8-6353-4c9a-932c-5bd104717500",
        flightNumber: 116,
        name: "Starlink-18 (v1.0)",
        dateUTC: "2021-02-04T06:19:00.000Z",
        dateUnix: 1612419540,
        dateLocal: "2021-01-04T01:19:00-05:00",
        datePrecision: DatePrecision.hour,
        upcoming: false,
        cores: [
            Cores(
                core: "5e9e28a5f359182b023b2656",
                flight: 3,
                gridfins: true,
                legs: true,
                reused: true,
                landingAttempt: true,
                landingSuccess: true,
                landingType: "ASDS",
                landpad: "5e9e3033383ecbb9e534e7cc"
            ),
            Cores(
                core: "5e9e28a6f35918c0803b265c",
                flight: 7,
                gridfins: nil,
                legs: true,
                reused: true,
                landingAttempt: true,
                landingSuccess: true,
                landingType: "RTLS",
                landpad: "5e9e3032383ecb267a34e7c7"
            )
        ],
        id: "5f8399fb818d8b59f5740d43"
    )
}
