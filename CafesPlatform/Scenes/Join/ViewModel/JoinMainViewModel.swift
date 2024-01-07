//
//  JoinMainViewModel.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import Foundation
import Common
import RxCocoa
import RxSwift
import NetworkTool

final class JoinMainViewModel: ViewModelType {
    struct Input {
        let join: Driver<Void>
    }
    struct Output {
        let joinResult: Driver<Result<JoinResultModel, HttpError>>
    }
    
    let useCase: ApplyJoinUseCase
    let navigator: JoinNavigator
    private var resultModel: JoinResultModel?
    
    init(useCase: ApplyJoinUseCase, navigator: JoinNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        
        let applyJoinResult = input.join.flatMapLatest {
            let test = self.useCase
                .applyJoin()
                .map { result in
                    let model = JoinMapper.map(result)
                    self.resultModel = model
                    return Result<JoinResultModel, HttpError>.success(model)
                }.asDriver(onErrorJustReturn: .failure(HttpError.serverError))
//                .catch { error in
//                    Driver.just(Result<JoinResultModel, HttpError>.failure(HttpError.serverError))
//                }
            return test
        }
        
        
    
        let output = Output(joinResult: applyJoinResult)
        return output
    }
    
    func showJoinDetail() {
        guard let model = resultModel else { return }
        navigator.showJoinDetail(model)
    }
}

extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<Element> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
