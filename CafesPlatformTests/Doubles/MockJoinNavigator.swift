//
//  MockJoinNavigator.swift
//  CafesPlatformTests
//
//  Created by Jiaxin Pu on 2023/11/19.
//

import Foundation
@testable import CafesPlatform

class MockJoinNavigator: JoinNavigator {
    var showJoinDetailCalled: Bool = false
    
    func showJoinDetail(_ model: JoinResultModel) {
        showJoinDetailCalled = true
    }
}
