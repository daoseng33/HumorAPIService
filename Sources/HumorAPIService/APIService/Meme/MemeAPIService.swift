//
//  MemeAPIService.swift
//  Meme
//
//  Created by DAO on 2024/8/30.
//

import Foundation
import RxSwift
import RxMoya
import Moya

public struct MemeAPIService: MemeAPIServiceProtocol {
    private let provider: MoyaProvider<MemeAPI>
    
    public init(useMockData: Bool = false) {
        provider = useMockData ? MoyaProvider<MemeAPI>.stub : MoyaProvider.default
    }
    
    public func fetchRandomMeme(with keyword: String, mediaType: MemeMediaType, minRating: Int) -> Single<MemeAPIResponse<RandomMeme, MemeError>> {
        return provider.rx
            .request(.randomMeme(keyword: keyword, mediaType: mediaType, minRating: minRating))
            .flatMap({ response in
                do {
                    let decode = try response.map(RandomMeme.self, using: JSONDecoder.default)
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
    
    public func fetchUpVoteMeme(with id: Int) -> Single<UpVote> {
        return provider.rx
            .request(.upVoteMeme(id: id))
            .map(UpVote.self, using: JSONDecoder.default)
    }
    
    public func fetchDownVoteMeme(with id: Int) -> Single<DownVote> {
        return provider.rx
            .request(.downVoteMeme(id: id))
            .map(DownVote.self, using: JSONDecoder.default)
    }
}
