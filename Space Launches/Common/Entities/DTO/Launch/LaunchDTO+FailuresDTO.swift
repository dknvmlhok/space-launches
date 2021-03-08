//
//  LaunchDTO+FailuresDTO.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 24.02.2021.
//

import Foundation

extension LaunchDTO {

    struct FailuresDTO: Decodable {
        let time: Int
        let altitude: Int?
        let reason: String
    }
}
