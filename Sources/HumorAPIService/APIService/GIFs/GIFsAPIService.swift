//
//  GIFsAPIService.swift
//  WebAPI
//
//  Created by DAO on 2024/9/22.
//

import Foundation
import RxSwift
import Moya
import RxMoya

public struct GIFsAPIService: GIFsAPIServiceProtocol {
    private let provider: MoyaProvider<GIFsAPI>
    
    public init(useMockData: Bool = false) {
        provider = useMockData ? MoyaProvider<GIFsAPI>.stub : MoyaProvider<GIFsAPI>.default
    }
    
    public func fetchGifs(query: String, number: Int) -> Single<GIFAPIResponse<GIFs, MemeError>> {
        provider.rx.request(.searchGiFs(query: query, number: number))
            .flatMap({ response in
                do {
                    let decode = try response.map(GIFs.self, using: JSONDecoder.default)
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
}
