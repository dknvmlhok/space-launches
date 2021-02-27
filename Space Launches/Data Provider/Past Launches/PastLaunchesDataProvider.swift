//
//  PastLaunchesDataProvider.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation
import Combine

final class PastLaunchesDataProvider: PastLaunchesDataProviderType {

    var getPastLaunches: AnyPublisher<[Launch], NetworkError> {
        API.pastLaunches
            .mapError(NetworkError.webServiceAgentError)
            .map {
                $0.map { $0.mapToDomain }
            }
            .eraseToAnyPublisher()
    }
}
