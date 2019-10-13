//
//  MPSPApi.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 12/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation
import PromiseKit

class MPSPApi {
    private let baseUrl = "https://www.mocky.io/v2"

    func requestService(endpoint: String, contract: RequestBase) -> Promise<Data> {
        let headers: [String: String] = [
            "reportId": ReportManager.shared.reportId ?? ""
        ]
        let completeUrl = baseUrl.appending(endpoint)
        return HTTPClient().requestData(url: completeUrl, method: .post, parameters: contract.toJSON(), headers: headers)
    }
    
//    func requestService<T: Decodable>(endpoint: String, contract: RequestBase, responseType: T.Type) -> Promise<T> {
//        let headers: [String: String] = [
//            "reportId": ReportManager.shared.reportId ?? ""
//        ]
//        return HTTPClient().request(url: baseUrl.appending(endpoint), method: .post, parameters: contract.toJSON(), headers: headers, parseAs: T.self)
//    }
}
