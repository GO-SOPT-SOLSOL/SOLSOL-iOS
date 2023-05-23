//
//  HTTPHeaderField.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/20.
//

import Foundation

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "Application/json"
}
