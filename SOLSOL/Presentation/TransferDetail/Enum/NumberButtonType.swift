//
//  NumberButtonType.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/18.
//

import Foundation

enum NumberButtonType: Int {
    case normal = 0
    case add10000
    case add50000
    case add100000
    case add1000000
    case addTotal

    var addNum: Int {
        switch self {
        case .normal:
            return 0
        case .add10000:
            return 10000
        case .add50000:
            return 50000
        case .add100000:
            return 100000
        case .add1000000:
            return 1000000
        case .addTotal:
            return 0
        }
    }
}
