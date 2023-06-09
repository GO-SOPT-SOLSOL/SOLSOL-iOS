////
////  Data.swift
////  SOLSOL
////
////  Created by 곽성준 on 2023/05/19.
import UIKit

struct AccountInfo {
    let bankImage: UIImage
    let bankName: String
    let bankAccount: String

    
}

extension AccountInfo{
    static func dummy() -> [AccountInfo]{
        return[AccountInfo(bankImage: ImageLiterals.Transfer.icBankShinhan,
                           bankName: "신한 청년희망적금",
                           bankAccount: "신한 230-434-224445"
                           ),
               AccountInfo(bankImage: ImageLiterals.Transfer.icBankKakao,
                           bankName: "마이홈플랜",
                           bankAccount: "카카오 3333-434-224445"
                          )]
    }
}
