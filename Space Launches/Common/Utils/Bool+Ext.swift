//
//  Bool+Ext.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 06/03/2021.
//

import Foundation

extension Bool {

    /// Converts Boolean to Yes/No
    var convertToConsentString: String {
        switch self {
        case true:
            return Loca.general.yes
        default:
            return Loca.general.no
        }
    }
}
