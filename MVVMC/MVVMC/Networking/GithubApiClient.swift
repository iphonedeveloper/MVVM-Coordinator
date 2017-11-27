//
//  GithubApiClient.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 25/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Result
import ObjectMapper
import Moya_ObjectMapper

struct GithubApiClient  {
    internal var provider = RequestProvider.sharedProvider
    
    internal func send<T: ImmutableMappable>(_ request: GithubService) -> Single<T>{
        return provider.rx.request(request).map{response -> T in
            return try response.mapObject(T.self)
            }
    }
}

extension GithubApiClient {
    
    internal func repositories(with language: String, sort:String) -> Single<SearchResult>{
        return send(.repositories(language: language, sort: sort))
    }
    
}
