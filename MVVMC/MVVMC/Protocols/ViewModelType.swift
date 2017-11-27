//
//  ViewModelType.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 27/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

