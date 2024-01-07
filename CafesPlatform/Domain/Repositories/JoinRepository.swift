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
    func applyJoin() -> Observable<JoinResultEntity>
}


