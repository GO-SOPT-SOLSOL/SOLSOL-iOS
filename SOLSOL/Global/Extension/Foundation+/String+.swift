//
//  String+.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/18.
//

import Foundation

extension String {
    func containsKoreanCharacters() -> Bool {
        let koreanRange = self.range(of: "\\p{Script=Hangul}", options: .regularExpression)
        return koreanRange != nil
    }
}
