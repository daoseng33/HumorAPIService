//
//  APIConfig.swift
//  HumorAPIService
//
//  Created by DAO on 2024/9/26.
//

import Foundation

final class APIConfiguration {
    static let shared = APIConfiguration()
    private init() {}
    
    var APIKey: String = ""
}
