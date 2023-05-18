//
//  MyAccount.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/18.
//

import Foundation

struct MyAccount {
    let name: String
    let bank: Bank
    let accountNumber: String
    let balance: Int
}


enum Bank: String {
    case kakao = "카카오뱅크"
    case shihan = "신한"
}


struct MyAccountViewModel {
    let bank: String
    let myAccount: String
    let balance: String
}

extension MyAccount {
    static func dummy() -> MyAccount {
        return MyAccount(name: "김민재", bank: .kakao, accountNumber: "110-345-961307", balance: 403033434)
    }

    func toViewModel() -> MyAccountViewModel {
        return MyAccountViewModel(bank: self.bank.rawValue, myAccount: self.accountNumber, balance: self.balance.currencyAmountToString())
    }
}
