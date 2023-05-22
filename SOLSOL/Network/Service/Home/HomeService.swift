//
//  HomeService.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/21.
//

import Foundation

protocol HomeServiceProtocol {
    
    func getADs(completion: @escaping (NetworkResult<BaseResponse<[AdvertisementListDTO]>>) -> Void)
    
    func getAccountsList(queryDTO: AccountsListRequestDTO, completion: @escaping (NetworkResult<BaseResponse<[AccountsListResponseDTO]>>) -> Void)
    
    func getCurrentAccoutsList(queryDTO: CurrentAccountListRequestDTO, completion: @escaping (NetworkResult<BaseResponse<CurrentAccountListResponseDTO>>) -> Void)
}


final class HomeService: APIRequestLoader<HomeTarget>, HomeServiceProtocol {
    
    func getADs(completion: @escaping (NetworkResult<BaseResponse<[AdvertisementListDTO]>>) -> Void) {
        
        fetchData(
            target: .getADs,
            responseData: BaseResponse<[AdvertisementListDTO]>.self, completion: completion)
    }
    
    func getAccountsList(queryDTO: AccountsListRequestDTO, completion: @escaping (NetworkResult<BaseResponse<[AccountsListResponseDTO]>>) -> Void) {

        fetchData(
            target: .getAccountsList(queryDTO),
            responseData: BaseResponse<[AccountsListResponseDTO]>.self, completion: completion)
    }
    
    func getCurrentAccoutsList(queryDTO: CurrentAccountListRequestDTO, completion: @escaping (NetworkResult<BaseResponse<CurrentAccountListResponseDTO>>) -> Void) {
        
        fetchData(
            target: .getCurrentAccountList(queryDTO),
            responseData: BaseResponse<CurrentAccountListResponseDTO>.self, completion: completion)
    }
}

