//
//  DataServicesResolver.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 13.02.2021.
//

import Resolver

extension Resolver {

    static func dataServices() {

        // MARK: - Past Launches

        register { PastLaunchesDataProvider() }
            .implements(PastLaunchesDataProviderType.self)

        // MARK: Past Launch Detail

        register { PastLaunchDetailDataProvider() }
            .implements(PastLaunchDetailDataProviderType.self)
            
    }
}
