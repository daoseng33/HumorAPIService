//
//  APIConfig.swift
//  HumorAPIService
//
//  Created by DAO on 2024/9/26.
//

import Foundation

public final class APIConfiguration {
    public static let shared = APIConfiguration()
    private init() {}
    
    public var APIKey: String = ""
}
