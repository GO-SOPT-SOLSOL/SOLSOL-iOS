//
//  TransferConfirmService.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/23.
//

import Foundation

protocol TransferConfirmProtocol {
    func transfer(queryDTO: AccountsListRequestDTO, requestDTO: TransferToRequestDTO, completion: @escaping (NetworkResult<BaseResponse<TransferToResponseDTO>>) -> Void)
}


final class TransferConfirmService: APIRequestLoader<TransferConfirmTarget>, TransferConfirmProtocol {
    func transfer(queryDTO: AccountsListRequestDTO, requestDTO: TransferToRequestDTO, completion: @escaping (NetworkResult<BaseResponse<TransferToResponseDTO>>) -> Void) {

        fetchData(target: .trasfer(queryDTO, requestDTO),
                  responseData: BaseResponse<TransferToResponseDTO>.self, completion: completion)

    }
}

