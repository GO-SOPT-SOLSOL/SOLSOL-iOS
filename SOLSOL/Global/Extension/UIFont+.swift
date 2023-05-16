//
//  UIFont+.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

<<<<<<< HEAD
extension UIFont {
    
    static func OneShinhanBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "OneShinhan-Bold", size: size)!
    }
    
    static func OneShinhanMedium(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "OneShinhan-Medium", size: size)!
    }
    
    static func OneShinhanLight(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "OneShinhan-Light", size: size)!
=======
enum FontName: String {
    case display5, display5Long
    case display4
    case display6
    case headline
    case subhead2Long
    case subhead1, subhead2, subhead3, subhead4
    case caption1, caption2
    case display6Light
    case body1, body2, body3, body4, body5, body6

    var rawValue: String {
        switch self {
        case .display5: return "OneShinhan-Bold"
        case .display5Long, .display4, .display6,
                .headline, .subhead1, .subhead2,
                .subhead3, .subhead4, .subhead2Long,
                .caption1, .caption2, .body3, .body5:
            return "OneShinhan-Medium"
        case .display6Light, .body1, .body2, .body4, .body6:
            return "OneShinhan-Light"
        }
    }

    var size: CGFloat {
        switch self {
        case .display5, .display5Long: return 25
        case .display4: return 22
        case .display6, .display6Light: return 20
        case .headline: return 18
        case .subhead4: return 16
        case .subhead3, .body6: return 14
        case .subhead2, .subhead2Long, .caption2, .body5: return 13
        case .subhead1, .body4: return 12
        case .caption1: return 9
        case .body1: return 10
        case .body2, .body3: return 11
        }
    }
}

extension UIFont {
    static func font(_ style: FontName) -> UIFont {
        return UIFont(name: style.rawValue, size: style.size)!
>>>>>>> 743b0deff34ecaf707603e4b4ada7be3523d5e11
    }
}
