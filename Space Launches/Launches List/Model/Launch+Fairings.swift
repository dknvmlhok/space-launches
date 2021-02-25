//
//  Launch+Fairings.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

// MARK: - Domain Object

extension Launch {

    struct Fairings {
        let reused: Bool?
        let recoveryAttempt: Bool?
        let recovered: Bool?
        let ships: [String]
    }
}

// MARK: - Domain Object Maping

extension LaunchDTO.FairingsDTO {

    var mapToDomain: Launch.Fairings {
        .init(
            reused: reused,
            recoveryAttempt: recoveryAttempt,
            recovered: recovered,
            ships: ships
        )
    }
}
