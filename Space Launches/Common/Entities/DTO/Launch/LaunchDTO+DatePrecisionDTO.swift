//
//  LaunchDTO+DatePrecisionDTO.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 24.02.2021.
//

import Foundation

extension LaunchDTO {

    enum DatePrecisionDTO: String, Decodable {
        case half
        case quarter
        case year
        case month
        case day
        case hour
    }
}
