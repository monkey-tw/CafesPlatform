//
//  JoinMapper.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import Foundation

class JoinMapper {
    static func map(_ entity: JoinResultEntity) -> JoinResultModel {
        return JoinResultModel(
            id: entity.id,
            createdAt: entity.createdAt,
            status: .init(rawValue: entity.status.rawValue) ?? .failure,
            reason: entity.reason
        )
    }
}
