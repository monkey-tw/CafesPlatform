//
//  JoinResultModel.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import Foundation

struct JoinResultModel {
    enum JoinResultStatus: String {
        case success
        case failure
    }
    let id: String
    let createdAt: String
    let status: JoinResultStatus
    let reason: String?
}
