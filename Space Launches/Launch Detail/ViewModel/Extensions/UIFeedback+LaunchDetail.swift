//
//  UIFeedback+LaunchDetail.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 02/03/2021.
//

import Foundation

extension UIFeedbacks {

    enum DetailState {
        case idle
        case loading
        case loaded(Launch)
        case error(NetworkError)
    }
}
