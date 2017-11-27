//
//  GithubService.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 25/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper

//https://api.github.com/search/repositories?q=language:swift&sort=stars


protocol Authorizationing {
    var requireAuthorization: Bool { get }
}

enum GithubService {
    case repositories(language:String, sort:String)
}

extension GithubService : TargetType {
    
    var baseURL: URL { return URL(string: "https://api.github.com/search/")! }
    
    var path: String {
        switch self {
        case .repositories:
            return "repositories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .repositories:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return "".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case .repositories(let language,let sort):
            return .requestParameters(parameters: ["q":"language:\(language)", "sort":sort], encoding: URLEncoding.default)
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .repositories:
            return URLEncoding.default
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .repositories:
            return nil
        }
    }
    
   
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

