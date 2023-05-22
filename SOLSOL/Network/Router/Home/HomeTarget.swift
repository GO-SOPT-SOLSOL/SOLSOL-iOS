//
//  HomeTarget.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/21.
//

import Foundation

import Alamofire

enum HomeTarget {
    case getAccountsList(_ dto: AccountsListRequestDTO)
}

extension HomeTarget: TargetType {

    var method: HTTPMethod {
        switch self {
        case .getAccountsList(_):
            return .get
        }
    }

    var path: String {
        switch self {
        case .getAccountsList(_):
            return "/accounts/"
        }
    }

    var parameters: RequestParams {
        switch self {
        case .getAccountsList(let dto):
            return .requestQuery(dto)
        }
    }

}
