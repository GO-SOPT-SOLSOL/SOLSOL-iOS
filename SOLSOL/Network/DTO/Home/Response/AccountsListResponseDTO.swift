//
//  AccountsListResponseDTO.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/21.
//

import Foundation

// MARK: - AccountsListResponseDTO

struct AccountsListResponseDTO: Decodable {
    let memberId: Int
    let id: Int
    let bank: String
    let name: String
    let balance: Int
    let accountNumber: String
}
