////
////  Data.swift
////  SOLSOL
////
////  Created by 곽성준 on 2023/05/19.
////
//
import UIKit

struct AccountInfo {
    let bankImage: UIImage
    let bankName: String
    let bankAccount: String

    
}
//
//struct AccountInfoWithDate{
//    let bankImage: UIImage
//    let name: String
//    let date: String
//    let bankAccount: String
//    let trashBinImage: UIImage
//}
//
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
//
//extension AccountInfoWithDate{
//    static func dummy() -> [AccountInfoWithDate]{
//        return[AccountInfoWithDate(bankImage: ImageLiterals.Transfer.icBankKB,
//                                   name: "곽성준",
//                                   date: "2023.05.22",
//                                   bankAccount: "국민 331314134135",
//                                   trashBinImage: ImageLiterals.Transfer.icDelete),
//               AccountInfoWithDate(bankImage: ImageLiterals.Transfer.icBankHanna,
//                                          name: "변희주",
//                                          date: "2023.05.26",
//                                          bankAccount: "하나 111234445",
//                                          trashBinImage: ImageLiterals.Transfer.icDelete),
//               AccountInfoWithDate(bankImage: ImageLiterals.Transfer.icBankKakao,
//                                          name: "김민재",
//                                          date: "2023.05.02",
//                                          bankAccount: "카카오 33334030191",
//                                          trashBinImage: ImageLiterals.Transfer.icDelete)]
//    }
//}
//
//
//
//
//
//
