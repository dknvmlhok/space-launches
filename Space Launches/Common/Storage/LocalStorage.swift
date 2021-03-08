//
//  LocalStorage.swift
//  Space Launches
//
//  Created by Dominik Kohlman on 27/02/2021.
//

import Foundation

struct LocalStorage {
    let storageKeys = StorageKeys()

    private let storage = UserDefaults.standard

    func set<T>(value: T, forKey key: String) {
        storage.set(value, forKey: key)
    }

    func getValue(forKey key: String) -> Any? {
        storage.value(forKey: key)
    }
}
