//
//  PastLaunchesDataProviderType.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation
import Combine

protocol PastLaunchesDataProviderType {
    var getPastLaunches: AnyPublisher<[Launch], NetworkError> { get }
}
