//
//  ApplyJoinUseCase.swift
//  CafesPlatformTests
//
//  Created by Jiaxin Pu on 2023/11/19.
//

import XCTest
@testable import CafesPlatform
import RxBlocking

final class ApplyJoinUseCaseTests: XCTestCase {
    private var repository: MockJoinRepository!
    private var sut: StandardApplyJoinUseCase!

    override func setUpWithError() throws {
        repository = MockJoinRepository()
        sut = StandardApplyJoinUseCase(repository: repository)
    }

    override func tearDownWithError() throws {
        repository = nil
        sut = nil
    }

    func testShouldReturnSuccess_whenCallApplyJoin_givenRepositoryReturnSuccess() throws {
        // Given
        repository.result = .success(.mock)
        
        // When
        let result = try sut.applyJoin().toBlocking(timeout: 1).single()
        
        // Then
        var isSuccess: Bool = false
        if case .success(_) = result {
            isSuccess = true
        }
        XCTAssertTrue(isSuccess)
    }

    func testShouldReturnError_whenCallApplyJoin_givenRepositoryReturnError() throws {
        // Given
        repository.result = .failure(.serverError)
        
        // When
        let result = try sut.applyJoin().toBlocking(timeout: 1).single()
        
        // Then
        var isFailure: Bool = false
        if case .failure(_) = result {
            isFailure = true
        }
        XCTAssertTrue(isFailure)
    }
}
