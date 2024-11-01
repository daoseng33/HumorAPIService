//
//  JokeAPIService.swift
//  WebAPI
//
//  Created by DAO on 2024/9/18.
//

import Foundation
import RxSwift
import Moya

public struct JokeAPIService: JokeAPIServiceProtocol {
    private let provider: MoyaProvider<JokeAPI>
    
    public init(useMockData: Bool = false) {
        provider = useMockData ? MoyaProvider<JokeAPI>.stub : MoyaProvider<JokeAPI>.default
    }
    
    public func fetchRandomJoke(tags: [JokeCategory], excludedTags: [JokeCategory], minRating: Int, maxLength: Int) -> Single<JokeAPIResponse<RandomJoke, MemeError>> {
        return provider.rx
            .request(.randomJoke(tags: tags, excludeTags: excludedTags, minRating: minRating, maxLength: maxLength))
            .flatMap({ response in
                do {
                    let decode = try response.map(RandomJoke.self, using: JSONDecoder.default)
                    return .just(.success(decode))
                } catch {
                    do {
                        let decode = try response.map(MemeError.self, using: JSONDecoder.default)
                        return .just(.failure(decode))
                    } catch {
                        return .error(error)
                    }
                }
            })
    }
    
    public func fetchUpVoteJoke(with id: Int) -> Single<UpVote> {
        return provider.rx
            .request(.upVoteJoke(id: id))
            .map(UpVote.self, using: JSONDecoder.default)
    }
    
    public func fetchDownVoteJoke(with id: Int) -> Single<DownVote> {
        return provider.rx
            .request(.downVoteJoke(id: id))
            .map(DownVote.self, using: JSONDecoder.default)
    }
}
