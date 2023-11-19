//
//  File.swift
//  
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import Foundation

struct ResponseWrapper<T: Decodable>: Decodable {
    let data: T
    let code: Int
    let message: String?
}
