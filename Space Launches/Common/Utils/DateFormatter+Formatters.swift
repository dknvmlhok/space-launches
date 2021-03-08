//
//  DateFormatter+Formatters.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 17.02.2021.
//

import Foundation

extension DateFormatter {

    enum DateFormat: String {
        case `default` = "yyyy-MM-dd'T'HH:mm:ssZ"
        case utc
    }

    /// Formates date string to Date
    ///
    /// - Parameters:
    ///   - format: ISO 8601 (UTC) or default "yyyy-MM-dd'T'HH:mm:ssZ" ISO format
    ///   - isoString: Date ISO format string to convert from
    static func formateStringToDate(
        with format: DateFormat = .default,
        from isoString: String)
    -> Date {
        switch format {
        case .default:
            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = format.rawValue

            guard let convertedToDate = dateFormatter.date(from: isoString) else {
                fatalError("Converting string to date has failed")
            }

            return convertedToDate

        case .utc:
            let dateFormatter = ISO8601DateFormatter()

            dateFormatter.timeZone = .autoupdatingCurrent
            dateFormatter.formatOptions = [
                .withFullDate,
                .withFullTime,
                .withDashSeparatorInDate,
                .withFractionalSeconds
            ]

            guard let convertedToDate = dateFormatter.date(from: isoString) else {
                fatalError("Converting string to date has failed")
            }

            return convertedToDate
        }
    }

    /// Formates Date ISO format string to human readable formate
    ///
    /// - Parameters:
    ///   - format: ISO 8601 (UTC) or default "yyyy-MM-dd'T'HH:mm:ssZ" ISO format
    ///   - isoString: Date ISO format string to convert from
    static func formateLocaleDate(
        with format: DateFormat = .default,
        from isoString: String
    ) -> String {
        let date = formateStringToDate(with: format, from: isoString)
        let dateFormatter = DateFormatter()

        dateFormatter.locale = .autoupdatingCurrent
        dateFormatter.timeZone = .autoupdatingCurrent
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short

        return dateFormatter.string(from: date)
    }

    /// Formates seconds to time string
    ///
    /// - Parameters:
    ///   - interval: Time interval, for example seconds
    ///   - unitsStyle: Constants for specifying how to represent quantities of time. Default values is .brief
    static func formateTime(
        from interval: Int,
        with unitsStyle: DateComponentsFormatter.UnitsStyle = .brief
    ) -> String {
        let formatter = DateComponentsFormatter()

        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = unitsStyle

        guard let formatedToTime = formatter.string(from: TimeInterval(interval)) else {
            fatalError("Formatting time interval to string has failed")
        }

        return formatedToTime
    }

}
