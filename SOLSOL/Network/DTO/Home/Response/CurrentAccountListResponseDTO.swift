//
//  CurrentAccountListDTO.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/23.
//

struct CurrentAccountListResponseDTO: Decodable {
    let transfers: [currentAccountListData]
}

struct currentAccountListData: Decodable {
    let id: Int
    let name: String
    let bank: String
    let accountNumber: String
    let createdAt: String
}
