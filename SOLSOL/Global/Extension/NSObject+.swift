//
//  NSObject+.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
