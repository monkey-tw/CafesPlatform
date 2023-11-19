//
//  MockApiClient.swift
//  CafesPlatformTests
//
//  Created by Jiaxin Pu on 2023/11/19.
//

import Foundation
@testable import CafesPlatform
import NetworkTool
import RxSwift

class MockApiClient: ApiClient {
    var jsonData: Data?
    var apiError: HttpError?
    
    func request<T: Decodable>(_ endpoint: ApiEndpoint) -> Observable<Result<T, HttpError>> {
        if let jsonData, let result = try? JSONDecoder().decode(T.self, from: jsonData) {
            return .just(.success(result))
        } else if let apiError {
            return .just(.failure(apiError))
        } else {
            return .just(.failure(.serverError))
        }
    }
}
