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
            .mapError { error in
                switch error {
                case is URLError:
                    guard let errorURL = error.asAFError?.url else {
                        return NetworkError.urlUnreachable(nil)
                    }

                    return NetworkError.urlUnreachable(errorURL.absoluteString)
                default:
                    return NetworkError.invalidResponse(error)
                }
            }
            .map {
                $0.map { $0.mapToDomain }
            }
            .eraseToAnyPublisher()
    }
}
