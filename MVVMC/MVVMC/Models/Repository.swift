//
//  Repository.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 25/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import Foundation
import ObjectMapper


//Repository Model
struct Repository {
    
    var identifier: Int
    var fullName: String
    var description : String
    var starsCount : Int
    var url: String
    
    public init(identifier:Int, fullName:String, description:String, starsCount:Int, url:String){
        self.identifier = identifier
        self.fullName = fullName
        self.description = description
        self.starsCount = starsCount
        self.url = url
    }
}

extension Repository : ImmutableMappable {
    public init(map: Map) throws {
        identifier = try map.value("id")
        description = try map.value("description")
        fullName = try map.value("full_name")
        starsCount = try map.value("stargazers_count")
        url = try map.value("html_url")
    }
}
extension Repository: Equatable {
    public static func == (lhs: Repository, rhs: Repository) -> Bool {
        return lhs.identifier == rhs.identifier &&
        lhs.description == rhs.description &&
        lhs.fullName == rhs.fullName &&
        lhs.starsCount == rhs.starsCount &&
        lhs.url == rhs.url
    }
}

