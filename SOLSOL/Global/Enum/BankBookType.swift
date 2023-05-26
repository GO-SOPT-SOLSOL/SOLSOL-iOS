//
//  BankBookType.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/24.
//

import Foundation

@frozen
enum BankBookType: String {
    case transfer = "TRANSFERS"
    case deposit = "DEPOSIT"

    var description: String {
        switch self {
        case .transfer:
            return "입출금"
        case .deposit:
            return "예적금"
        }
    }
}
