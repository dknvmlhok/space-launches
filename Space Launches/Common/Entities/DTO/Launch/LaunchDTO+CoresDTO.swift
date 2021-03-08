//
//  LaunchDTO+CoresDTO.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 24.02.2021.
//

import Foundation

// MARK: - Data Object

extension LaunchDTO {

    struct CoresDTO: Decodable {
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

// MARK: - Coding Keys

private extension LaunchDTO.CoresDTO {

    enum CodingKeys: String, CodingKey {
        case core
        case flight
        case gridfins
        case legs
        case reused
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }
}
