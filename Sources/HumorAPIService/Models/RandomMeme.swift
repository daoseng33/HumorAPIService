//
//  RandomMeme.swift
//  MemeData
//
//  Created by DAO on 2024/8/31.
//

import Foundation
import RealmSwift

public class RandomMeme: Object, Decodable, TimeSensitive, Favoritable {
    @Persisted(primaryKey: true) public var id: Int
    @Persisted public var memeDescription: String
    public var url: URL? {
        URL(string: urlString)
    }
    @Persisted public var urlString: String
    @Persisted public var type: String
    public var mediaType: MemeMediaType {
        return Utility.getMediaType(with: type)
    }
    @Persisted public var createdAt: Date = Date()
    @Persisted public var isFavorite: Bool = false
    
    required public init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        memeDescription = try container.decode(String.self, forKey: .description)
        type = try container.decode(String.self, forKey: .type)

        let urlString = try container.decode(String.self, forKey: .url)
        self.urlString = urlString
    }
    
    public override init() {
        super.init()
    }

    private enum CodingKeys: String, CodingKey {
        case id, description, url, type
    }
}
