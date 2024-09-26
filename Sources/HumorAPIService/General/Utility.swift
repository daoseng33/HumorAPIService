//
//  Utility.swift
//  WebAPI
//
//  Created by DAO on 2024/9/3.
//

import Foundation

public struct Utility {
    public static func loadJSON(filename: String) -> Data {
        guard let url = Bundle.module.url(forResource: filename, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return Data()
        }
        return data
    }
}
