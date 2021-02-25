//
//  NetworkError.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Foundation

enum NetworkError: Identifiable, LocalizedError {
    var id: String { localizedDescription }
    
    case urlUnreachable(String?)
    case invalidResponse(Error)

    var errorDescription: String? {
        switch self {
        case .urlUnreachable(let url):
            print("\n❌ Requested URL is unreachable. \(url ?? "")\n")
            return "unreachable requested URL"
        case .invalidResponse(let error):
            print("\n❌ \(error.localizedDescription). Status code: \(error.asAFError?.responseCode ?? 0)\n")
            return "invalid server response"
        }
    }
}
