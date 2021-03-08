//
//  UIFeedbacks.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 02/03/2021.
//

import Foundation

struct UIFeedbacks {

    enum Event {
        case onAppear
        case onRefresh
        case onSelectSortType(SortType)
        case onSearchBarEdit(String)
        case onSearchBarEndEditing
    }
}
