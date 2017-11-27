//
//  RequestProvider.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 25/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import Foundation
import Moya

class RequestProvider {
    public static var shared = RequestProvider()
    
    public static func endpointClosure(target: GithubService) -> Endpoint<GithubService> {
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    
        return defaultEndpoint
    }
    
    public static func defaultProvider() -> MoyaProvider<GithubService> {
        let provider = MoyaProvider<GithubService>(endpointClosure: RequestProvider.endpointClosure)
        return provider
    }
    
    private struct SharedProvider {
        static var instance = RequestProvider.defaultProvider()
    }
    
    public static var sharedProvider: MoyaProvider<GithubService> {
        get {
            return SharedProvider.instance
        }
        set (newSharedProvider) {
            SharedProvider.instance = newSharedProvider
        }
    }
    
}
