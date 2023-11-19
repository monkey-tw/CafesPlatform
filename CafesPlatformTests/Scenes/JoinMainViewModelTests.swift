//
//  JoinMainViewModelTests.swift
//  CafesPlatformTests
//
//  Created by Jiaxin Pu on 2023/11/19.
//

import XCTest
@testable import CafesPlatform
import RxSwift
import RxCocoa

final class JoinMainViewModelTests: XCTestCase {
    private var navigator: MockJoinNavigator!
    private var useCase: MockApplyJoinUseCase!
    private var sut: JoinMainViewModel!
    private var bags = DisposeBag()
    
    override func setUpWithError() throws {
        navigator = MockJoinNavigator()
        useCase = MockApplyJoinUseCase()
        sut = JoinMainViewModel(useCase: useCase, navigator: navigator)
    }
    
    override func setUp() {
        navigator.showJoinDetailCalled = false
        useCase.applyJoinCalled = false
    }

    override func tearDownWithError() throws {
        navigator = nil
        useCase = nil
        sut = nil
    }
    
    func testShouldCallApplyJoin_whenClickJoin() {
        // Given
        let joinEvent = PublishSubject<Void>()
        let input = JoinMainViewModel.Input(join: joinEvent.asDriver(onErrorJustReturn: ()))
        let output = sut.transform(input: input)
        
        // When
        output.joinResult.drive().disposed(by: bags)
        joinEvent.onNext(())
        
        // Then
        XCTAssertTrue(useCase.applyJoinCalled)
    }

}
