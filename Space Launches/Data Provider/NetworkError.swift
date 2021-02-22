//
//  NetworkError.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

enum NetworkError: Identifiable, LocalizedError {
    var id: String { localizedDescription }
    
    case urlUnreachable(URL)
    case invalidResponse(Error)

    var errorDescription: String? {
        switch self {
        case .urlUnreachable(let url):
            print("\n***\n Requested URL is unreachable: \(url) \n***")
            return "unreachable requested URL"
        case .invalidResponse:
            #warning("TODO: print status codes")
            print("\n***\n Server response is invalid. Status code: \n***")
            return "invalid server response"
        }
    }
}
