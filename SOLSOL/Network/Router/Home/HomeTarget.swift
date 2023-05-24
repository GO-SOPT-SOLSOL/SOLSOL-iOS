//
//  HomeTarget.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/21.
//

import Foundation

import Alamofire

enum HomeTarget {
    case getADs
    case getAccountsList(_ dto: AccountsListRequestDTO)
    case getCurrentAccountList(_ dto: CurrentAccountListRequestDTO)
}

extension HomeTarget: TargetType {

    var method: HTTPMethod {
        switch self {
        case .getADs:
            return .get
        case .getAccountsList(_):
            return .get
        case .getCurrentAccountList(_):
            return .get
        }
    }

    var path: String {
        switch self {
        case .getADs:
            return "/ads"
        case .getAccountsList(_):
            return "/accounts/"
        case .getCurrentAccountList(_):
            return "/transfers"
        }
    }

    var parameters: RequestParams {
        switch self {
        case .getADs:
            return .requestPlain
        case .getAccountsList(let dto):
            return .requestQuery(dto)
        case .getCurrentAccountList(let dto):
            return .requestQuery(dto)
        }
    }

}
