//
//  PastLaunchDetailDataProviderType.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 01/03/2021.
//

import Combine

typealias LaunchId = String

protocol PastLaunchDetailDataProviderType {
    func getPastLaunchDetail(with launchId: LaunchId) -> AnyPublisher<Launch, NetworkError>
}
