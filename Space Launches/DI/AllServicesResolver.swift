//
//  AllServicesResolver.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 11.02.2021.
//

import Resolver

extension Resolver: ResolverRegistering {

    public static func registerAllServices() {
        dataServices()
    }
}
