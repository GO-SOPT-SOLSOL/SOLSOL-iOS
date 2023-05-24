//
//  Transfer.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/18.
//

// MARK: - 서버에서 받아올 계좌 정보 담아둘 구조체

import UIKit

struct Transfer {
    let kind: String
    let bank: String
    let name: String
    let money: Int
    let accountNumber: String
}
