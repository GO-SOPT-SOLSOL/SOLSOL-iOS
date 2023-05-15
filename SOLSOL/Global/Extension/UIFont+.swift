//
//  UIFont+.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

enum FontName: String {
    case display5
    case display5Long
    case display4
    case display6
    case headline
    case subhead4
    case subhead3
    case subhead2
    case subhead2Long
    case subhead1
    case caption2
    case caption1
    case display6Light

    var rawValue: String {
        switch self {
        case .display5: return "OneShinhan-Bold"
        case .display5Long, .display4, .display6,
                .headline, .subhead1, .subhead2,
                .subhead3, .subhead4, .subhead2Long,
                .caption1, .caption2:
            return "OneShinhan-Medium"
        case .display6Light: return "OneShinhan-Light"
        }
    }

    var size: CGFloat {
        switch self {
        case .display5, .display5Long: return 25
        case .display4: return 22
        case .display6, .display6Light: return 20
        case .headline: return 18
        case .subhead4: return 16
        case .subhead3: return 14
        case .subhead2, .subhead2Long, .caption2: return 13
        case .subhead1: return 12
        case .caption1: return 9
        }
    }
}

extension UIFont {
    static func font(_ style: FontName) -> UIFont {
        return UIFont(name: style.rawValue, size: style.size)!
    }
}
