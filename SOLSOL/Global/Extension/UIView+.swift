//
//  UIView+.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
