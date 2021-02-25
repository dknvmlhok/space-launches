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

    func run<T: Decodable>(_ url: URLConvertible) -> AnyPublisher<[T], Error> {
        AF.request(url, method: .get)
            .publishData()
            .compactMap { $0.data }
            .decode(type: [T].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
