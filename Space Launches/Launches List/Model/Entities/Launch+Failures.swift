//
//  Launch+Failures.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

// MARK: - Domain Object

extension Launch {

    struct Failures {
        let time: Int
        let altitude: Int?
        let reason: String
    }
}

// MARK: - Domain Object Maping

extension LaunchDTO.FailuresDTO {

    var mapToDomain: Launch.Failures {
        .init(
            time: time,
            altitude: altitude,
            reason: reason
        )
    }
}
