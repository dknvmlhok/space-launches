//
//  DateFormatter+Formatters.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 17.02.2021.
//

import Foundation

extension DateFormatter {

    /// Formates date string to Date
    ///
    /// - Parameters:
    ///   - format: date ISO format. Default format is "yyyy-MM-dd'T'HH:mm:ssZ"
    ///   - isoString: Date ISO format string to convert from
    static func formateStringToDate(
        with format: String = "yyyy-MM-dd'T'HH:mm:ssZ",
        from isoString: String)
    -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        guard let convertedToDate = dateFormatter.date(from: isoString) else {
            fatalError("Converting string to date has failed")
        }

        return convertedToDate
    }

    /// Formates Date ISO format string to human readable formate
    ///
    /// - Parameters:
    ///   - isoString: Date ISO format string to convert from
    static func formateLocaleDate(from isoString: String) -> String {
        let date = formateStringToDate(from: isoString)
        let dateFormatter = DateFormatter()

        dateFormatter.locale = .autoupdatingCurrent
        dateFormatter.timeZone = .autoupdatingCurrent
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short

        return dateFormatter.string(from: date)
    }
}
