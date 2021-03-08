//
//  LocalizationKit.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 18.02.2021.
//

import Foundation

typealias Loca = LocalizationKit

struct LocalizationKit {

    static let general = General()
    static let errors = Errors()
    static let dates = Dates()
    static let launchesList = LaunchesList()
    static let launchDetail = LaunchDetail()
}

extension LocalizationKit {

    struct General {
        let ok = "OK"
        let cancel = "Cancel"
        let loading = "Loading..."
        let yes = "Yes"
        let no = "No"
    }

    struct Errors {
        let networkError = "Network Error"
        let launchesListLoadingError = "Past Launches could not load due to"
        let launchDetailLoadingError = "Past Launch could not load due to"
        let unknownError = "Unknown Error"
    }

    struct Dates {
        let dateTitle = "Date"
        let half = "Half year"
        let quarter = "Quarter year"
        let year = "Year"
        let month = "Month"
        let day = "Day"
        let hour = "Hour"
    }

    struct LaunchesList {
        let sort = Sort()

        let navigationBarTitle = "Space-X Launches"
        let navigationBarItem = "Sort By"
        let LaunchesListSectionHeader = "Past Launches"

        struct Sort {
            let title = "Select sorting method"
            let sortByName = "By Name"
            let sortByDate = "By Date"
        }
    }

    struct LaunchDetail {
        let fairings = Fairings()
        let failures = Failures()
        let links = Links()

        let nameTitle = "Launch Name"
        let localLaunchDateTitle = "Local Launch Date"
        let staticFireDateTitle = "Local Static Fire Date"
        let successTitle = "Success"
        let datePrecisionTitle = "Date Precision"
        let flightNumberTitle = "Flight Number"
        let detailsTitle = "Details"
        let fairingsTitle = "Payload Fairings"
        let failuresTitle = "Failures"
        let linksTitle = "Links"

        struct Fairings {
            let reusedTitle = "Parts Reused"
            let recoveryAttemptTitle = "Recovery Attempt"
            let recoveredTitle = "Parts Recovered"
        }

        struct Failures {
            let timeTitle = "Time"
            let altitudeTitle = "Altitude"
            let reasonTitle = "Reason"
        }

        struct Links {
            let articleTitle = "Article"
            let wikipediaTitle = "Wikipedia"
            let webcastTitle = "Youtube Webcast"
        }
    }
}
