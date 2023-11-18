//
//  JoinMainViewModel.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import Foundation
import Common
import RxCocoa
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
            return self.useCase
                .applyJoin()
                .map { result in
                    switch result {
                    case .success(let success):
                        let model = JoinMapper.map(success)
                        self.resultModel = model
                        return Result<JoinResultModel, HttpError>.success(model)
                    case .failure(let failure):
                        return Result<JoinResultModel, HttpError>.failure(failure)
                    }
            }.asDriver(onErrorJustReturn: .failure(.serverError))
        }
        
        let output = Output(joinResult: applyJoinResult)
        return output
    }
    
    func showJoinDetail() {
        guard let model = resultModel else { return }
        navigator.showJoinDetail(model)
    }
}
