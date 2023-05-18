//
//  Transfer.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/18.
//

import UIKit

struct Transfer {
    let image: UIImage
    let bankBook: String
    let account: String
    let money: String
}

extension Transfer {
    static func dummy() -> [Transfer] {
        return [Transfer(image: ImageLiterals.Home.icBigBankShinhan,
                         bankBook: "쏠편한 입출금통장(저축예금)",
                         account: "신한 110-345-961307",
                         money: "3,964,717"),
                Transfer(image: ImageLiterals.Home.icSmallBankWoori,
                         bankBook: "우리 SUPER 주거래통장",
                         account: "우리 1002-460-75587",
                         money: "1,273,982")]}
}
