//
//  Launch.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

// MARK: - Domain Object

struct Launch: Identifiable {

    let fairings: Fairings?
    let links: Links
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let tbd: Bool
    let net: Bool
    let window: Int?
    let rocket: String?
    let success: Bool?
    let failures: [Failures]
    let details: String?
    let crew: [String]
    let ships: [String]
    let capsules: [String]
    let payloads: [String]
    let launchpad: String?
    let autoUpdate: Bool
    let launchLibraryId: String?
    let flightNumber: Int
    let name: String
    let dateUTC: String
    let dateUnix: Int
    let dateLocal: String
    let datePrecision: DatePrecision
    let upcoming: Bool
    let cores: [Cores]
    let id: String
}

// MARK: - Domain Object Maping

extension LaunchDTO {

    var mapToDomain: Launch {
        .init(
            fairings: fairings?.mapToDomain,
            links: links.mapToDomain,
            staticFireDateUTC: staticFireDateUTC,
            staticFireDateUnix: staticFireDateUnix,
            tbd: tbd,
            net: net,
            window: window,
            rocket: rocket,
            success: success,
            failures: failures.map { $0.mapToDomain },
            details: details,
            crew: crew,
            ships: ships,
            capsules: capsules,
            payloads: payloads,
            launchpad: launchpad,
            autoUpdate: autoUpdate,
            launchLibraryId: launchLibraryId,
            flightNumber: flightNumber,
            name: name,
            dateUTC: dateUTC,
            dateUnix: dateUnix,
            dateLocal: dateLocal,
            datePrecision: datePrecision.mapToDomain,
            upcoming: upcoming,
            cores: cores.map { $0.mapToDomain },
            id: id
        )
    }
}
