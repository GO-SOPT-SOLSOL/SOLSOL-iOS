//
//  SingleAccountResponseDTO.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/24.
//

import Foundation

struct SingleAccountResponseDTO: Decodable {
    let id: Int
    let memberId: Int
    let name: String
    let bank: String
    let kind: String
    let accountNumber: String
    let balance: String
}
