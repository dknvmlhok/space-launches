//
//  Launch+Fairings.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

extension Launch {

    struct Fairings: Codable {
        let reused: Bool?
        let recoveryAttempt: Bool?
        let recovered: Bool?
        let ships: [String]
    }
}

// MARK: - Coding Keys

private extension Launch.Fairings {

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered
        case ships
    }
}
