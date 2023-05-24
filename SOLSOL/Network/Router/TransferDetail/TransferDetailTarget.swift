//
//  TransferDetailTarget.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/24.
//

import Foundation

import Alamofire

enum TransferDefailTarget {
    case getSingleAccountInfo(_ accountNum: Int, _ queryDTO: AccountsListRequestDTO)

}

extension TransferDefailTarget: TargetType {
    var method: HTTPMethod {
        switch self {
        case .getSingleAccountInfo:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getSingleAccountInfo(let accountNum, _):
            return "/accounts/\(accountNum)"
        }
    }

    var parameters: RequestParams {
        switch self {
        case let .getSingleAccountInfo(_, queryDTO):
            return .requestQuery(queryDTO)
        }
    }


}
