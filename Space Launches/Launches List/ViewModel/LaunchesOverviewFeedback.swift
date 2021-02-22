//
//  LaunchesOverviewFeedback.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 21.02.2021.
//

import Foundation

struct LaunchesOverviewFeedback {

    enum OverviewState {
        case idle
        case loading
        case loaded([Launch])
        case error(NetworkError)
    }

    enum SearchState {
        case idle
        case loading
        case loaded([Launch])
    }

    enum Event {
        case onAppear
        case onSelectSortType(SortType)
        case onSearchBarEdit(String)
        case onRefresh
    }

    enum SortType {
        case byName
        case byDate
    }
}
