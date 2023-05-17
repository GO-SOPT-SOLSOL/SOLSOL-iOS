//
//  TransferList.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/18.
//

import UIKit

struct TransferList {
    let image: UIImage
    let name: String
    let money: String
}

extension TransferList {
    static func dummy() -> [TransferList] {
        return [TransferList(image: ImageLiterals.Home.icSmallBankKakao,
                             name: "오미나",
                             money: "30,000"),
                TransferList(image: ImageLiterals.Home.icSmallBankWoori,
                                     name: "백송현",
                                     money: "100,000"),
                TransferList(image: ImageLiterals.Home.icSmallBankKB,
                                     name: "강국희",
                                     money: "20,000"),
                TransferList(image: ImageLiterals.Home.icSmallBankHanna,
                                     name: "이호준",
                                     money: "1,000,000"),
                TransferList(image: ImageLiterals.Home.icSmallBankWoori,
                                     name: "변희주",
                                     money: "50,000")]}
}


