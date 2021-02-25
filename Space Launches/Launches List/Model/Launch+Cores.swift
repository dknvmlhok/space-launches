//
//  Launch+Cores.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

// MARK: - Domain Object

extension Launch {

    struct Cores {
        let core: String?
        let flight: Int?
        let gridfins: Bool?
        let legs: Bool?
        let reused: Bool?
        let landingAttempt: Bool?
        let landingSuccess: Bool?
        let landingType: String?
        let landpad: String?
    }
}

// MARK: - Domain Object Maping

extension LaunchDTO.CoresDTO {

    var mapToDomain: Launch.Cores {
        .init(
            core: core,
            flight: flight,
            gridfins: gridfins,
            legs: legs,
            reused: reused,
            landingAttempt: landingAttempt,
            landingSuccess: landingSuccess,
            landingType: landingType,
            landpad: landpad
        )
    }
}
