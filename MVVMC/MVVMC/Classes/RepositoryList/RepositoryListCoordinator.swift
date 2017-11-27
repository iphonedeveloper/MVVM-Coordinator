//
//  RepositoryListCoordinator.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 26/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import Foundation
import RxSwift

class RepositoryListCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    override func start() -> Observable<Void> {
        let viewModel = RepositoryListViewModel()
        let viewController = RepositoryListViewController.initFromStoryboard(name: "Main")
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.viewModel = viewModel
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
}


