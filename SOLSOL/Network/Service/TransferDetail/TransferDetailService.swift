//
//  TransferDetailService.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/24.
//

import Foundation

protocol TransferDetailProtocol {
    func getSingleAccountInfo(accountNum: Int, queryDTO: AccountsListRequestDTO, completion: @escaping (NetworkResult<BaseResponse<SingleAccountResponseDTO>>) -> Void)
}


final class TransferDetailService: APIRequestLoader<TransferDefailTarget>, TransferDetailProtocol {
    func getSingleAccountInfo(accountNum: Int, queryDTO: AccountsListRequestDTO, completion: @escaping (NetworkResult<BaseResponse<SingleAccountResponseDTO>>) -> Void) {

        fetchData(target: .getSingleAccountInfo(accountNum, queryDTO),
                  responseData: BaseResponse<SingleAccountResponseDTO>.self, completion: completion)

    }
}

