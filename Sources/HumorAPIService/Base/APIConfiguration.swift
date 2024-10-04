//
//  APIConfiguration.swift
//  HumorAPIService
//
//  Created by DAO on 2024/9/26.
//

import Foundation

public enum APIConfiguration {
    public static var apiKey: String = ""
    
    /// When useMockData is set to true, all API responses will only use mock data.
    /// This setting is only applicable for development or Continuous Integration (CI) environments.
    /// In production environments, ensure this value is set to false to use real API data.
    public static var useMockData: Bool = false
}
