//
//  TransferTarget.swift
//  SOLSOL
//
//  Created by 곽성준 on 2023/05/26.
//

import Foundation

import Alamofire

enum TransferTarget{
    case getRecentSentAccountList(_ dto: RecentSentAccountListRequestDTO)
    case deleteRecentAccount(_ dto: DeleteRecentAccountRequestDTO, _ transferId: Int)
}

extension TransferTarget: TargetType{
    
    
    
    var method: Alamofire.HTTPMethod {
        switch self{
        case .getRecentSentAccountList(_):
            return .get
        case .deleteRecentAccount(_,_):
            return .delete
            
        }
    }
    
    var path: String {
        switch self{
        case .getRecentSentAccountList(_):
            return "/transfers"
        case .deleteRecentAccount( _ , let transferId):
            return "/transfers/\(transferId)"
            
        }
    }
    
    var parameters: RequestParams {
        switch self{
        case .getRecentSentAccountList(let dto):
            return .requestQuery(dto)
        case .deleteRecentAccount(let dto, _):
            return .requestQuery(dto)
            
            
        }
    }
}

