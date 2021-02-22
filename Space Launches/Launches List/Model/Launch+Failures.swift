//
//  Launch+Failures.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

extension Launch {

    struct Failures: Codable {
        let time: Int
        let altitude: Int?
        let reason: String
    }
}
