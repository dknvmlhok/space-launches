//
//  NetworkError.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 27.02.2021.
//

import Foundation

enum NetworkError: Identifiable, LocalizedError {
    case webServiceAgentError(WebServiceAgentError)

    var id: String { localizedDescription }

    var errorDescription: String? {

        switch self {
        case .webServiceAgentError(let error):
            switch error {
            case .urlUnreachable(let url):
                print("\n❌ Requested URL is unreachable. \(String(describing: url))\n")
                return "unreachable request URL"
            case .invalidServerResponse:
                print("\n❌ invalid server response\n")
                return "invalid server response"
            case .noInternetConnection:
                print("\n❌ No internet connection\n")
                return "no internet connection"
            }
        }
    }
}
