//
//  Transfer.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/18.
//

import UIKit

struct Transfer {
    let image: UIImage
    let account: String
    let money: String
}

extension Transfer {
    static func dummy() -> [Transfer] {
        return [Transfer(image: ImageLiterals.Home.icBigBankShinhan,
                         account: "신한 110-345-961307",
                         money: "3,964,717"),
                Transfer(image: ImageLiterals.Home.icSmallBankWoori,
                         account: "우리 1002-460-75587",
                         money: "1,273,982")]}
}
