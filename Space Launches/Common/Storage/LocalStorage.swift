//
//  LocalStorage.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 27/02/2021.
//

import Foundation

struct LocalStorage {
    let storageKeys = StorageKeys()

    func set<T>(value: T, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    func getValue(forKey key: String) -> Any? {
        UserDefaults.standard.value(forKey: key)
    }

}
