//
//  API.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 23.02.2021.
//

import Foundation
import Combine

enum API {

    private static let base = "https://api.spacexdata.com/v4"
    private static let webServiceAgent = WebServiceAgent()

    enum Endpoint {
        static let pastLaunches = "/launches/past"
    }

    static var pastLaunches: AnyPublisher<[LaunchDTO], WebServiceAgentError> {
        let url = URL(string: base + Endpoint.pastLaunches)!

        return webServiceAgent.run(url)
    }
}
