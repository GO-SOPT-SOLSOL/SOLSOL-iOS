//
//  Bank.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/24.
//

import UIKit

@frozen
enum Bank: String {
    case kakao = "KAKAO"
    case shihan = "SHINHAN"
    case hana = "HANA"
    case woori = "WOORI"
    case kookmin = "KOOKMIN"

    var description: String {
        switch self {
        case .kakao:
            return "카카오뱅크"
        case .shihan:
            return "신한"
        case .hana:
            return "하나"
        case .woori:
            return "우리"
        case .kookmin:
            return "국민"
        }
        
    }

    var bankLogo: UIImage {
        switch self {
        case .kakao:
            return ImageLiterals.Home.icSmallBankKakao
        case .shihan:
            return ImageLiterals.Home.icBankShinhan
        case .hana:
            return ImageLiterals.Home.icSmallBankHanna
        case .woori:
            return ImageLiterals.Home.icSmallBankWoori
        case .kookmin:
            return ImageLiterals.Home.icSmallBankKB

        }

    }
}
