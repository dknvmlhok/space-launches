//
//  Binding+Ext.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 20.02.2021.
//

import SwiftUI

extension Binding {
    /// Updates value of @Binding property wrapper when value changes and optionally performs completion.
    func onChange(_ completion: ((Value) -> Void)? = nil) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue

                if let completion = completion {
                    completion(newValue)
                }
            }
        )
    }
}
