//
//  WebServiceAgent.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 23.02.2021.
//

import Foundation
import Combine
import Alamofire

struct WebServiceAgent {

    private let networkManager = NetworkReachabilityManager()

    func run<T: Decodable>(_ url: URLConvertible) -> AnyPublisher<T, WebServiceAgentError> {

        if networkManager?.isReachable ?? false {

            return AF.request(url, method: .get)
                .publishData()
                .setFailureType(to: WebServiceAgentError.self)
                .compactMap { $0.data }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .mapError { error in
                    switch error.asAFError {
                    case .invalidURL(url: let url):
                        return .urlUnreachable(try? url.asURL())
                    default:
                        return .invalidServerResponse
                    }
                }
                .timeout(.seconds(5), scheduler: DispatchQueue.main, customError: { .timeout })
                .eraseToAnyPublisher()
        }

        return .init(Fail(error: WebServiceAgentError.noInternetConnection))
    }
}
