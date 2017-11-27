//
//  SearchResult.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 26/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import Foundation
import ObjectMapper

struct SearchResult {
    var totalCount : Int
    var items : [Repository]
    
    public init(totalCount:Int, items:[Repository]){
        self.totalCount = totalCount
        self.items = items
    }
}

extension SearchResult : ImmutableMappable {
    public init(map: Map) throws {
        totalCount = try map.value("total_count")
        items = try map.value("items")
    }
}

