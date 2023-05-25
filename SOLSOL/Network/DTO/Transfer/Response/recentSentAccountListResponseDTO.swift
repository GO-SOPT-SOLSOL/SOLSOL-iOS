//
//  recentSentAccountListResponseDTO.swift
//  SOLSOL
//
//  Created by 곽성준 on 2023/05/26.
//

import Foundation

struct recentSentAccountListResponseDTO: Decodable{
    let transfers: [recentSentAccountList]
}

struct recentSentAccountList: Decodable{
    let id: Int
    let accountId: Int
    let name: String
    let bank: String
    let accountNumber: String
    let price: Int
    let createdAt: String
}
