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
    
    func request<T: Decodable>(_ endpoint: ApiEndpoint) -> Observable<T> {
        if let jsonData, let result = try? JSONDecoder().decode(T.self, from: jsonData) {
            return .just(result)
        } else if let apiError {
            return .error(apiError)
        } else {
            return .error(HttpError.serverError)
        }
    }
}
