//
//  JoinDetailViewModel.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import Foundation
import Common

class JoinDetailViewModel: ViewModelType {
    struct Input {}
    struct Output {}
    
    let model: JoinResultModel
    
    init(model: JoinResultModel) {
        self.model = model
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
