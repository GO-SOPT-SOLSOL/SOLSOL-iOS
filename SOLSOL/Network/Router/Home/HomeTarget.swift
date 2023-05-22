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
    case getADs
}

extension HomeTarget: TargetType {

    var method: HTTPMethod {
        switch self {
        case .getAccountsList(_):
            return .get
        case .getADs:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getAccountsList(_):
            return "/accounts/"
        case .getADs:
            return "/ads"
        }
        
    }

    var parameters: RequestParams {
        switch self {
        case .getAccountsList(let dto):
            return .requestQuery(dto)
        case .getADs:
            return .requestPlain
        }
    }

}
