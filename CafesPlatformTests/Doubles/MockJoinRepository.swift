//
//  MockJoinRepository.swift
//  CafesPlatformTests
//
//  Created by Jiaxin Pu on 2023/11/19.
//

import UIKit
@testable import CafesPlatform
@testable import NetworkTool
import RxSwift

class MockJoinRepository: JoinRepository {
    var result: Result<JoinResultEntity, HttpError> = .success(.mock)
    
    func applyJoin() -> Observable<JoinResultEntity> {
        return .just(result)
    }
}

extension JoinResultEntity {
    static var mock: JoinResultEntity = .init(id: "id", createdAt: "2001-01-01", status: .success, reason: nil)
}
