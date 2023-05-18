//
//  Int+.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/18.
//

import Foundation


extension Int {
    func currencyAmountToString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: self) ?? "0"
    }
}
