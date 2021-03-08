//
//  UIFeedback+LaunchesOverview.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 02/03/2021.
//

import Foundation

extension UIFeedbacks {

    enum OverviewState {
        case idle
        case loading
        case loaded([Launch])
        case error(NetworkError)
    }

    enum SortType: String {
        case byName
        case byDate
    }

}
