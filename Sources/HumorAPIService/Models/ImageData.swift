//
//  ImageData.swift
//  MemeData
//
//  Created by DAO on 2024/9/22.
//

import Foundation
import RealmSwift

public class ImageData: Object, Decodable, TimeSensitive, Favoritable {
    @Persisted(primaryKey: true) public var urlString: String
    public var url: URL? {
        return URL(string: urlString)
    }
    @Persisted public var width: Int
    @Persisted public var height: Int
    @Persisted public var createdAt: Date = Date()
    @Persisted public var isFavorite: Bool = false
    
    enum CodingKeys: CodingKey {
        case url
        case width
        case height
    }
    
    required public init(from decoder: any Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        urlString = try container.decode(String.self, forKey: .url)
        width = try container.decode(Int.self, forKey: .width)
        height = try container.decode(Int.self, forKey: .height)
    }
    
    public convenience init(urlString: String, width: Int = 100, height: Int = 100, createdAt: Date = Date(), isFavorite: Bool = false) {
        self.init()
        self.urlString = urlString
        self.width = width
        self.height = height
        self.createdAt = createdAt
        self.isFavorite = isFavorite
    }
    
    public override init() {
        super.init()
    }
}
