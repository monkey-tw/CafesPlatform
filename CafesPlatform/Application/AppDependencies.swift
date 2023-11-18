//
//  AppDependencies.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/17.
//

import Foundation
import NetworkTool

protocol AppDependencies {
    var apiClient: ApiClient { get }
}

class StandardAppDependencies: AppDependencies {
    let configuration = AppConfiguration()
    let apiClient: ApiClient
    
    init() {
        apiClient = StandardApiClient(baseUrl: configuration.baseUrl)
    }
}
