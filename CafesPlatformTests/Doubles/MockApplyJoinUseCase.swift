//
//  MockApplyJoinUseCase.swift
//  CafesPlatformTests
//
//  Created by Jiaxin Pu on 2023/11/19.
//

import Foundation
@testable import CafesPlatform
import NetworkTool
import RxSwift

class MockApplyJoinUseCase: ApplyJoinUseCase {
    var applyJoinCalled: Bool = false
    var result: Result<JoinResultEntity, HttpError> = .success(.mock)
    
    func applyJoin() -> Observable<Result<JoinResultEntity, HttpError>> {
        applyJoinCalled = true
        return .just(result)
    }
}
