//
//  RepositoryViewModel.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 26/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import Foundation

class RepositoryViewModel {
    let name: String
    let description: String
    let starsCountText: String
    let url: URL
    
    init(repository: Repository) {
        self.name = repository.fullName
        self.description = repository.description
        self.starsCountText = "⭐️ \(repository.starsCount)"
        self.url = URL(string: repository.url)!
    }
}

