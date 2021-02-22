//
//  DateFormatter+Formatters.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 17.02.2021.
//

import Foundation

extension DateFormatter {

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
