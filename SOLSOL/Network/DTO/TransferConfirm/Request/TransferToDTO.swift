//
//  TransferToDTO.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/23.
//

import Foundation

struct TransferToRequestDTO: Encodable {
    let senderAccountsId: Int
    let price: Int
    let bank: String
    let number: String
    let transferMemo: String
    let receiverMemo: String
    let charge: Int
}
