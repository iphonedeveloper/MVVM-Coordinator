//
//  RepositoryListViewModel.swift
//  MVVMC
//
//  Created by Pierpaolo Marturano on 25/11/2017.
//  Copyright © 2017 iPhoneDeveloper.it. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class RepositoryListViewModel : ViewModelType {

    struct Input {
        let trigger: Driver<Void>
    }
    struct Output {
        let fetching: Driver<Bool>
        let title: Observable<String>
        let alertMessage: Observable<String>
        let repositories: Driver<[RepositoryViewModel]>
    }
    
    func transform(input: RepositoryListViewModel.Input) -> RepositoryListViewModel.Output {
        let activityIndicator = ActivityIndicator()
    
        let githubProvider = RequestProvider.defaultProvider()
        let apiClient = GithubApiClient(provider: githubProvider)

        let repositories = input.trigger.flatMapLatest {_ in
            return apiClient.repositories(with: "Swift", sort: "stars").map{ return $0.items.map(RepositoryViewModel.init)}.asObservable()
             .trackActivity(activityIndicator)
             .asDriverOnErrorJustComplete()
        }
        let fetching = activityIndicator.asDriver()
    
        let _alertMessage = PublishSubject<String>()
        let alertMessage = _alertMessage.asObservable()
        
        let _currentLanguage = BehaviorSubject<String>(value: "Swift")
        let title = _currentLanguage.asObservable()
            .map { "\($0)" }
        
        return Output(fetching:fetching,title:title,alertMessage:alertMessage,repositories:repositories)
    }
    
    
    
    
    /* // Initializer
     init(initialLanguage: String) {
     
     
     let _currentLanguage = BehaviorSubject<String>(value: initialLanguage)
     self.setCurrentLanguage = _currentLanguage.asObserver()
     
     let _alertMessage = PublishSubject<String>()
     self.alertMessage = _alertMessage.asObservable()
     
     self.title = _currentLanguage.asObservable()
     .map { "\($0)" }
     let _repositories = Driver<[RepositoryViewModel]>.empty()
     self.repositories = _repositories
     
     
     
     
     let res = apiClient.repositories(with: "Swift", sort: "stars").map{ return $0.items.map(RepositoryViewModel.init)}
     res.subscribe { [unowned self] event in
     switch event {
     case .success(let response):
     self.repositories = Observable.from(optional: response)
     case .error(let error):
     print(error)
     }
     }.disposed(by: disposeBag)
     //res.subscribe { _ in }.disposed(by: disposeBag)
     //self.repositories = res.asObservable()
     
     }*/
}
