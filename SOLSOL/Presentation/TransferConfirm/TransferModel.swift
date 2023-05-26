//
//  TransferModel.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/24.
//

import Foundation


// MARK: - 최근 이체 목록 조회 API -> TransferDetail

struct ReceiverModel {
    let receiverName: String
    let receiverBank: Bank
    let receiverAccount: String
}

// MARK: - 계좌 목록 조회 -> Transfer1

struct MyBankAccount {
    let memberId: Int
    let accountId: Int
    let bank: Bank
    let bankBookName: String?
    let bankBookType: BankBookType?
    let account: String
    let balance: Int
}

// MARK: - Transfer1 -> TransferDetail

struct TransferDetailModel {
    let receiver: ReceiverModel
    let sender: MyBankAccount
    let price: String?
}

// Transfer-2
