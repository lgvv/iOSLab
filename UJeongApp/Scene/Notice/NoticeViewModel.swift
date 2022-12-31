//
//  NoticeViewModel.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import UIKit
import RxSwift
import RxCocoa

final class NoticeViewModel: ViewModelType {
    struct Input {
        let searchTrigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    
    struct Output {
        let notices: Driver<[NoticeSection]>
        let selectedNotice: Driver<Notice>
    }
    
    private let useCase: NoticeUseCase
    
    init(useCase: NoticeUseCaseImpl) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        
        let selectedPost = input.selection
            
        
        return Output(notices: .empty(),
                      selectedNotice: .empty())
    }
}


//final class NoticeViewModel: ViewModelType {
//    typealias Input = <#type#>
//
//    typealias Output = <#type#>
//
//    let input = PublishSubject<String>()
//
//    let output: Driver<SearchInfomation>
//
//    init(apiClient: APIClient = APIClient()) {
//        self.output = apiClient.searchWithRx()
//            .asDriver(onErrorJustReturn: .init(totalCount: nil, incompleteResults: nil, items: []))
//
//    }
//}
//
//extension NoticeViewController {
//
//}
