//
//  LaunchDTO+FairingsDTO.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 24.02.2021.
//

import Foundation

// MARK: - Data Object

extension LaunchDTO {

    struct FairingsDTO: Decodable {
        let reused: Bool?
        let recoveryAttempt: Bool?
        let recovered: Bool?
        let ships: [String]
    }
}

// MARK: - Coding Keys

private extension LaunchDTO.FairingsDTO {

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered
        case ships
    }
}
