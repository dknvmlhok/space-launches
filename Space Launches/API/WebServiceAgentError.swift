//
//  WebServiceAgentError.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

enum WebServiceAgentError: Error {
    case urlUnreachable(URL?)
    case noInternetConnection
    case invalidServerResponse
}
