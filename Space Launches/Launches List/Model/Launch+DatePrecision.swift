//
//  Launch+DatePrecision.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

extension Launch {

    enum DatePrecision: String, Codable {
        case half
        case quarter
        case year
        case month
        case day
        case hour
    }
}
