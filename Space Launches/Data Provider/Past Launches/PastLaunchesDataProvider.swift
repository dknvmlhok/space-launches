//
//  PastLaunchesDataProvider.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation
import Combine

final class PastLaunchesDataProvider {

}

extension PastLaunchesDataProvider: PastLaunchesDataProviderType {

    var getPastLaunches: AnyPublisher<[Launch], NetworkError> {
        let launchSubject = CurrentValueSubject<[Launch], Error>([Launch.mock])

        return launchSubject
            .mapError { error in
                switch error {
                case is URLError:
                    return NetworkError.urlUnreachable(URL(string: "")!)
                default:
                    return NetworkError.invalidResponse(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
