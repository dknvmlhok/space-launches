//
//  Launch+DatePrecision.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

// MARK: - Domain Object

extension Launch {

    enum DatePrecision: String {
        case half
        case quarter
        case year
        case month
        case day
        case hour

        var localized: String {
            switch self {
            case .half:
                return Loca.dates.half
            case .quarter:
                return Loca.dates.quarter
            case .year:
                return Loca.dates.year
            case .month:
                return Loca.dates.month
            case .day:
                return Loca.dates.day
            case .hour:
                return Loca.dates.hour
            }
        }
    }
}

// MARK: - Domain Object Maping

extension LaunchDTO.DatePrecisionDTO {

    var mapToDomain: Launch.DatePrecision {
        switch self {
        case .half:
            return .half
        case .quarter:
            return .quarter
        case .year:
            return .year
        case .month:
            return .month
        case .day:
            return .day
        case .hour:
            return .half
        }
    }
}
