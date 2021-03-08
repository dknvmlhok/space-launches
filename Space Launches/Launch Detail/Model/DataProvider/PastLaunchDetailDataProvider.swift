//
//  PastLaunchDetailDataProvider.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 01/03/2021.
//

import Combine

final class PastLaunchDetailDataProvider: PastLaunchDetailDataProviderType {

    func getPastLaunchDetail(with launchId: LaunchId) -> AnyPublisher<Launch, NetworkError> {
        API.pastLaunch(with: launchId)
            .mapError(NetworkError.webServiceAgentError)
            .map { $0.mapToDomain }
            .eraseToAnyPublisher()
    }
}
