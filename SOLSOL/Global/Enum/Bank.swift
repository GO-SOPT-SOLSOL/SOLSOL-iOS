//
//  Bank.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/24.
//

import UIKit

enum Bank: String {
    case kakao = "KAKAO"
    case shihan = "SHINHAN"

    var description: String {
        switch self {
        case .kakao:
            return "카카오뱅크"
        case .shihan:
            return "신한"
        }
    }

    var bankLogo: UIImage {
        switch self {
        case .kakao:
            return ImageLiterals.Home.icSmallBankKakao
        case .shihan:
            return ImageLiterals.Home.icBigBankShinhan
        }

    }
}
