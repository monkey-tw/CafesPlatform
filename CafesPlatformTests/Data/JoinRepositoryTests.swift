//
//  JoinRepositoryTests.swift
//  CafesPlatformTests
//
//  Created by Jiaxin Pu on 2023/11/19.
//

import XCTest
@testable import CafesPlatform
import NetworkTool
import RxBlocking

final class JoinRepositoryTests: XCTestCase {
    private var apiClient: MockApiClient!
    private var sut: StandardJoinRepository!

    override func setUpWithError() throws {
        apiClient = MockApiClient()
        sut = StandardJoinRepository(apiClient: apiClient)
    }

    override func tearDownWithError() throws {
        apiClient = nil
        sut = nil
    }

    func testShouldReturnSuccess_whenCallJoin_givenApiClientReturnJsonData() throws {
        // Given
        let entity: JoinResultEntity = .mock
        apiClient.jsonData = try? JSONEncoder().encode(entity)
        
        // When
        let result = try sut.applyJoin().toBlocking(timeout: 1).single()
        
        // Then
        var isSuccess: Bool = false
        if case .success(_) = result {
            isSuccess = true
        }
        XCTAssertTrue(isSuccess)
    }
    
    func testShouldReturnError_whenCallJoin_givenApiClientReturnError() throws {
        // Given
        apiClient.jsonData = nil
        apiClient.apiError = .serverError
        
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
