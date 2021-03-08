//
//  LaunchDTO.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 24.02.2021.
//

import Foundation

// MARK: - Data Object

struct LaunchDTO: Decodable {

    let fairings: FairingsDTO?
    let links: LinksDTO
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let tbd: Bool
    let net: Bool
    let window: Int?
    let rocket: String?
    let success: Bool?
    let failures: [FailuresDTO]
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
    let datePrecision: DatePrecisionDTO
    let upcoming: Bool
    let cores: [CoresDTO]
    let id: String
}

// MARK: - Coding Keys

private extension LaunchDTO {

    enum CodingKeys: String, CodingKey {
        case fairings
        case links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case tbd
        case net
        case window
        case rocket
        case success
        case failures
        case details
        case crew
        case ships
        case capsules
        case payloads
        case launchpad
        case autoUpdate = "auto_update"
        case launchLibraryId = "launch_library_id"
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming
        case cores
        case id
    }
}
