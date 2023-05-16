//
//  UITabBarController+.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/16.
//

import UIKit


extension UITabBarController {
    func setUpTabBar() {
        let appearance = UITabBar.appearance()
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = UIImage()
        appearance.clipsToBounds = true
    }

}
