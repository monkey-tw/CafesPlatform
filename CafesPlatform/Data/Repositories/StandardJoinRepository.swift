//
//  StandardJoinRepository.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/19.
//

import Foundation
import NetworkTool
import RxSwift

class StandardJoinRepository: JoinRepository {
    private let apiClient: ApiClient
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func applyJoin() -> Observable<JoinResultEntity> {
        let endpoint = StandardApiEndpoint(method: .post, path: "applyJoin", headers: nil, params: nil)
        return apiClient.request(endpoint)
    }
}
