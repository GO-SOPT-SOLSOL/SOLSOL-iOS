//
//  BaseResponse.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/21.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
}
