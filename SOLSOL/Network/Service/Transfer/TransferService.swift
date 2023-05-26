//	
//  TransferService.swift
//  SOLSOL
//
//  Created by 곽성준 on 2023/05/26.
//

import Foundation

protocol TransferServiceProtocol {
    
    func getRecentSentAccountList(queryDTO: RecentSentAccountListRequestDTO, completion: @escaping (NetworkResult<BaseResponse<RecentSentAccountListResponseDTO>>) -> Void)
    
    func deleteRecentAccount(queryDTO: DeleteRecentAccountRequestDTO, transferId: Int, completion: @escaping (NetworkResult<BaseResponse<DeleteRecentAccountResponseDTO>>) -> Void)
    
}

final class TransferService: APIRequestLoader<TransferTarget>, TransferServiceProtocol {
    
    
    func getRecentSentAccountList(queryDTO: RecentSentAccountListRequestDTO, completion: @escaping (NetworkResult<BaseResponse<RecentSentAccountListResponseDTO>>) -> Void) {
        fetchData(target: .getRecentSentAccountList(queryDTO), responseData: BaseResponse<RecentSentAccountListResponseDTO>.self, completion: completion)
    }
    
    func deleteRecentAccount(queryDTO: DeleteRecentAccountRequestDTO, transferId:Int, completion: @escaping (NetworkResult<BaseResponse<DeleteRecentAccountResponseDTO>>) -> Void) {
        fetchData(target: .deleteRecentAccount(queryDTO, transferId), responseData: BaseResponse<DeleteRecentAccountResponseDTO>.self, completion: completion)
    }
    
    
   
}
