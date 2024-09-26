//
//  MemeTargetType.swift
//  Meme
//
//  Created by DAO on 2024/8/30.
//

import Foundation
import Moya

protocol MemeTargetType: TargetType {}

extension MemeTargetType {
    public var baseURL: URL {
        var urlComponents = URLComponents(string: "https://api.humorapi.com")!
        
        let queryItems = [
            URLQueryItem(name: "api-key", value: APIConfiguration.shared.APIKey)
        ]
        urlComponents.queryItems = queryItems
        
        let url = urlComponents.url!
        
        return url
    }
}
