//
//  Section.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/17.
//

// MARK: - tableView Section 구분 위한 Enum

@frozen
enum Section: Int, CaseIterable {
        case advertisement = 0
        case myAccount
        case transfer
        case shinhanPlus
        case deliveryPackaging
        case category
        case footerButton
}

