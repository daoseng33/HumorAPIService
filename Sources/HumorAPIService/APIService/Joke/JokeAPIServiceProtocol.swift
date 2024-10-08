//
//  JokeAPIServiceProtocol.swift
//  WebAPI
//
//  Created by DAO on 2024/9/18.
//

import Foundation
import RxSwift

public enum JokeAPIResponse<RandomJoke, MemeError> {
    case success(RandomJoke)
    case failure(MemeError)
}

public protocol JokeAPIServiceProtocol: BaseAPIServiceProtocol {
    func fetchRandomJoke(tags: [JokeCategory], excludedTags: [JokeCategory], minRating: Int, maxLength: Int) -> Single<JokeAPIResponse<RandomJoke, MemeError>>
}
