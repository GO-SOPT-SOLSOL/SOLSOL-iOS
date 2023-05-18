//
//  Literal.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/14.
//

import UIKit

enum ImageLiterals {

    enum Common {
        static var icArrowRight: UIImage { .load(named: "icArrowRight") }
    }
    
    enum NavigationBar {
        static var icChatBot: UIImage { .load(named: "icChatBot") }
        static var icVoice: UIImage { .load(named: "icVoice") }
        static var icMypage: UIImage { .load(named: "icMypage") }
        static var icHomeOutline: UIImage { .load(named: "icHomeOutline") }
        static var icArrowLeft: UIImage { .load(named: "icArrowLeft") }
    }
    
    enum TabBar {
        static var icHomeOn: UIImage { .load(named: "icHomeOn") }
        static var icHomeOff: UIImage { .load(named: "icHomeOff") }
        static var icMoneybusOn: UIImage { .load(named: "icMoneybusOn") }
        static var icMoneybusOff: UIImage { .load(named: "icMoneybusOff") }
        static var icProductOn: UIImage { .load(named: "icProductOn") }
        static var icProductOff: UIImage { .load(named: "icProductOff") }
        static var icBenefitOn: UIImage { .load(named: "icBenefitOn") }
        static var icBenefitOff: UIImage { .load(named: "icBenefitOff") }
        static var icMenuOn: UIImage { .load(named: "icMenuOn") }
        static var icMenuOff: UIImage { .load(named: "icMenuOff") }
    }
    
    enum Home {
        static var adImage: UIImage { .load(named: "adImage") }
        static var icArrowRightBlue: UIImage { .load(named: "icArrowRightBlue") }
        static var icBigBankShinhan: UIImage { .load(named: "icBigBankShinhan") }
        static var icCopy: UIImage { .load(named: "icCopy") }
        static var icMore: UIImage { .load(named: "icMore") }
        static var icRefresh: UIImage { .load(named: "icRefresh") }
        static var icSmallBankHanna: UIImage { .load(named: "icSmallBankHanna") }
        static var icSmallBankKakao: UIImage { .load(named: "icSmallBankKakao") }
        static var icSmallBankKB: UIImage { .load(named: "icSmallBankKB") }
        static var icSmallBankWoori: UIImage { .load(named: "icSmallBankWoori") }
        static var icShinhanPlus: UIImage { .load(named: "icShinhanPlus") }
        static var pullingLogo: UIImage { .load(named: "pullingLogo") }
        static var returnCup: UIImage { .load(named: "returnCup") }
        static var SOLTips: UIImage { .load(named: "SOLTips") }
        static var storyBank: UIImage { .load(named: "storyBank") }
        static var SOLWallet: UIImage { .load(named: "SOLWallet") }
        static var SOLBaseball: UIImage { .load(named: "SOLBaseball") }
        static var assignCard: UIImage { .load(named: "assignCard") }
        static var currentStock: UIImage { .load(named: "currentStock") }
        static var certification: UIImage { .load(named: "certification") }
        static var icChange: UIImage { .load(named: "icChange") }
        static var icShaking: UIImage { .load(named: "icShaking") }
        static var icEasyhome: UIImage { .load(named: "icEasyhome") }

    }

    enum Transfer {
        static var icSearchDefault: UIImage { .load(named: "icSearchDefault") }
        static var icSearchEnable: UIImage { .load(named: "icSearchEnable") }
        static var icBankShinhan: UIImage { .load(named: "icBankShinhan") }
        static var icBankWoori: UIImage { .load(named: "icBankWoori") }
        static var icBankKB: UIImage { .load(named: "icBankKB") }
        static var icBankKakao: UIImage { .load(named: "icBankKakao") }
        static var icBankHanna: UIImage { .load(named: "icBankHanna") }
        static var icDelete: UIImage { .load(named: "icDelete") }
    }

    enum TransferDetail {
        static var icBackSpace: UIImage { .load(named: "icBackSpace") }
        static var icArrowDown: UIImage { .load(named: "icArrowDown") }
    }
}


extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }

    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
