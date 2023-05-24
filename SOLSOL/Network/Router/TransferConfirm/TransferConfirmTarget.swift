//
//  TransferConfirmTarget.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/23.
//

import Foundation

import Alamofire

enum TransferConfirmTarget {
    case trasfer(_ queryDTO: AccountsListRequestDTO, _ requestDTO: TransferToRequestDTO)

}

extension TransferConfirmTarget: TargetType {
    var method: HTTPMethod {
        switch self {
        case .trasfer:
            return .post
        }
    }

    var path: String {
        switch self {
        case .trasfer:
            return "/transfers"
        }
    }

    var parameters: RequestParams {
        switch self {
        case let .trasfer(queryDTO, requestDTO):
            return .requestQueryWithBody(queryDTO, bodyParameter: requestDTO)
        }
    }


}
