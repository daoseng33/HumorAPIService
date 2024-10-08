//
//  RandomJoke.swift
//  MemeData
//
//  Created by DAO on 2024/9/18.
//

import Foundation
import RealmSwift

public class RandomJoke: Object, Decodable, TimeSensitive, Favoritable {
    @Persisted(primaryKey: true) public var id: Int
    @Persisted public var joke: String
    @Persisted public var createdAt: Date = Date()
    @Persisted public var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id, joke
    }

    public required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        joke = try container.decode(String.self, forKey: .joke)
    }
    
    public convenience init(id: Int, joke: String, createdAt: Date = Date(), isFavorite: Bool = false) {
        self.init()
        self.id = id
        self.joke = joke
        self.createdAt = createdAt
        self.isFavorite = isFavorite
    }
    
    public override init() {
        super.init()
    }
}
