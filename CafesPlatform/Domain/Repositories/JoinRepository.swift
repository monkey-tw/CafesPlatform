//
//  JoinRepository.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import Foundation
import RxSwift
import NetworkTool

protocol JoinRepository {
    func applyJoin() -> Observable<Result<JoinResultEntity, HttpError>>
}

class StandardJoinRepository: JoinRepository {
    private let apiClient: ApiClient
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func applyJoin() -> Observable<Result<JoinResultEntity, HttpError>> {
        let endpoint = StandardApiEndpoint(method: .post, path: "applyJoin", headers: nil, params: nil)
        return apiClient.request(endpoint)
    }
}
