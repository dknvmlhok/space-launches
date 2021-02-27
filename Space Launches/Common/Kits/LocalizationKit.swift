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
    static let launchesList = LaunchesList()
    static let sort = Sort()
    static var search = Search()
}

extension LocalizationKit {

    struct General {
        let ok = "OK"
        let cancel = "Cancel"
        let loading = "Loading..."
    }

    struct Errors {
        let networkError = "Network Error"
        let launchesListLoadingError = "Past Launches could not load due to"
        let unknownError = "Unknown Error"
    }

    struct LaunchesList {
        let navigationBarTitle = "Space-X Launches"
        let navigationBarItem = "Sort By"
        let listSectionHeader = "Past Launches"
    }

    struct Sort {
        let title = "Select sorting method"
        let sortByName = "By Name"
        let sortByDate = "By Date"
    }

    struct Search {
        let placeholder = "Search"
    }
}
