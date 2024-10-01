//
//  APIConfiguration.swift
//  HumorAPIService
//
//  Created by DAO on 2024/9/26.
//

import Foundation

public enum APIConfiguration {
    private static let lock = NSLock()
    nonisolated(unsafe) private static var _apiKey: String = ""
    
    public static var apiKey: String {
        get {
            lock.lock()
            defer { lock.unlock() }
            return _apiKey
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            _apiKey = newValue
        }
    }
}
