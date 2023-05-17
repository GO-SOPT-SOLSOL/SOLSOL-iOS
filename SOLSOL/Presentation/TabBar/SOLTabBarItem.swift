//
//  SOLTabBarItem.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/16.
//

import UIKit

enum SOLTabBarItem: String, CaseIterable {
    case home
    case moneyVerse
    case product
    case benefit
    case allMenus

    var viewController: UIViewController {
        switch self {
        case .home: return TransferDetailViewController()
        case .moneyVerse: return MoneyVerseViewController()
        case .product: return ProductViewController()
        case .benefit: return BenefitViewController()
        case .allMenus: return AllMenusViewController()
        }
    }

    var unselectedImage: UIImage {
        switch self {
        case .home: return ImageLiterals.TabBar.icHomeOff
        case .moneyVerse: return ImageLiterals.TabBar.icMoneybusOff
        case .product: return ImageLiterals.TabBar.icProductOff
        case .benefit: return ImageLiterals.TabBar.icBenefitOff
        case .allMenus: return ImageLiterals.TabBar.icMenuOff
        }
    }

    var selectedImage: UIImage {
        switch self {
        case .home: return ImageLiterals.TabBar.icHomeOn
        case .moneyVerse: return ImageLiterals.TabBar.icMoneybusOn
        case .product: return ImageLiterals.TabBar.icProductOn
        case .benefit: return ImageLiterals.TabBar.icBenefitOn
        case .allMenus: return ImageLiterals.TabBar.icMenuOn
        }
    }

    var name: String {
        switch self {
        case .home: return StringLiterals.TabBar.ItemTitle.home
        case .moneyVerse: return StringLiterals.TabBar.ItemTitle.moneyVerse
        case .product: return StringLiterals.TabBar.ItemTitle.product
        case .benefit: return StringLiterals.TabBar.ItemTitle.benefit
        case .allMenus: return StringLiterals.TabBar.ItemTitle.allMenus
        }
    }


}

