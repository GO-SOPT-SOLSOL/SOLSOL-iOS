//
//  NetworkService.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/21.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()

    private init() {}

    let homeService: HomeServiceProtocol = HomeService(apiLogger: APIEventLogger())
    let transferConfirmService: TransferConfirmProtocol = TransferConfirmService(apiLogger: APIEventLogger())
}
