//
//  JokeAPI.swift
//  WebAPI
//
//  Created by DAO on 2024/9/18.
//

import Foundation
import Moya

public enum JokeCategory: String, CaseIterable {
    case Random
    case Clean
    case Relationship
    case School
    case Animal
    case DeepThoughts = "Deep Thoughts"
    case Jewish
    case Food
    case Dark
    case Racist
    case Sexual
    case OneLiner = "One Liner"
    case Insults
    case KnockKnock = "Knock Knock"
    case Political
    case Sexist
    case Sport
    case ChuckNorris = "Chuck Norris"
    case Holiday
    case Blondes
    case YoMomma = "Yo Momma"
    case Analogy
    case Law
    case NSFW
    case Christmas
    case Nerdy
    case Religious
    case Kids
}

public enum JokeAPI {
    case randomJoke(tags: [JokeCategory], excludeTags: [JokeCategory], minRating: Int, maxLength: Int)
    case upVoteJoke(id: Int)
    case downVoteJoke(id: Int)
}

extension JokeAPI: MemeTargetType {
    public var path: String {
        switch self {
        case .randomJoke:
            return "jokes/random"
            
        case .upVoteJoke(id: let id):
            return "/jokes/\(id)/upvote"
            
        case .downVoteJoke(id: let id):
            return "/jokes/\(id)/downvote"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .randomJoke:
            return .get
            
        case .upVoteJoke, .downVoteJoke:
            return .post
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .randomJoke(let tags, let excludeTags, let minRating, let maxLength):
            let tagsParam = tags.map { $0.rawValue }.joined(separator: ",")
                .replacingOccurrences(of: JokeCategory.Random.rawValue, with: "")
            let excludeTagsParam = excludeTags.map { $0.rawValue }.joined(separator: ",")
                .replacingOccurrences(of: JokeCategory.Random.rawValue, with: "")
            
            return .requestParameters(parameters: [
                "include-tags": tagsParam,
                "exclude-tags": excludeTagsParam,
                "min-rating": minRating,
                "max-length": maxLength
            ], encoding: URLEncoding.queryString)
            
        case .upVoteJoke, .downVoteJoke:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .randomJoke, .upVoteJoke, .downVoteJoke:
            return nil
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .randomJoke(let tages, _, _ , _):
            if tages == [.Animal, .Sexual] {
                return Utility.loadJSON(filename: "random_joke_error")
            } else {
                return Utility.loadJSON(filename: "random_joke")
            }
            
        case .upVoteJoke:
            return Utility.loadJSON(filename: "vote_upvote")
            
        case .downVoteJoke:
            return Utility.loadJSON(filename: "vote_downvote")
        }
    }
}
