//
//  UIColor+.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

extension UIColor {
    static var gray600: UIColor {
        return UIColor(hex: "#121518")
    }
    static var gray400: UIColor {
        return UIColor(hex: "#575C61")
    }
    static var grayWarm400: UIColor {
        return UIColor(hex: "#666666")
    }
    static var gray300: UIColor {
        return UIColor(hex: "#818891")
    }
    static var gray250: UIColor {
        return UIColor(hex: "#9AA0A7")
    }
    static var gray200: UIColor {
        return UIColor(hex: "#BAC1C8")
    }
    static var gray150: UIColor {
        return UIColor(hex: "#E5E9ED")
    }
    static var gray100: UIColor {
        return UIColor(hex: "#F3F6FA")
    }
    static var gray50: UIColor {
        return UIColor(hex: "#F8F9FC")
    }
    static var blue600: UIColor {
        return UIColor(hex: "#254EBE")
    }
    static var blue500: UIColor {
        return UIColor(hex: "#306FE1")
    }
    static var blue100: UIColor {
        return UIColor(hex: "#E7F0FB")
    }
    static var blu50: UIColor {
        return UIColor(hex: "#F3F6FB")
    }
    static var white: UIColor {
        return UIColor(hex: "#ffffff")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
