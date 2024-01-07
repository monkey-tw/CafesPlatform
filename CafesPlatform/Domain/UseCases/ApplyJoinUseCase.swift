//
//  ApplyJoinUseCase.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import Foundation
import RxSwift
import NetworkTool

protocol ApplyJoinUseCase {
    func applyJoin() -> Observable<JoinResultEntity>
}

class StandardApplyJoinUseCase: ApplyJoinUseCase {
    private let repository: JoinRepository
    
    init(repository: JoinRepository) {
        self.repository = repository
    }
    
    func applyJoin() -> Observable<JoinResultEntity> {
        repository.applyJoin()
    }
}
