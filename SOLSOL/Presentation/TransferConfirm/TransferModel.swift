//
//  TransferModel.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/24.
//

import Foundation


// MARK: - 최근 이체 목록 조회 API -> TransferDetail

struct Receiver {
    let receiverName: String
    let receiverBank: Bank
    let receiverAccount: Int
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

// MARK: - TransferDetail -> TransferConfirm

struct TransferDetail {
    let receiver: Receiver
    let sender: MyBankAccount
}

// Transfer-2
struct TransferConfirm {
    let receiver: Receiver
    let sender: MyBankAccount
    let receiverMemo: String
    let myAccountMemo: String
    let fee: Int
}
