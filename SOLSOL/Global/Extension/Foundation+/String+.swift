//
//  String+.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/18.
//

import Foundation

extension String {
    func currencyToNormalString() -> Self {
        self.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "원", with: "")
    }
}
