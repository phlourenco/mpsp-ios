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
    private var baseUrl: String {
        #if MOCK
        return "https://www.mocky.io/v2"
        #elseif HOMOLOG
        return "http://localhost:8080"
        #else
        return "http://google.com"
        #endif
    }

    func requestService(endpoint: String, contract: RequestBase) -> Promise<Data> {
        let headers: [String: String] = [
            "reportId": ReportManager.shared.reportId ?? ""
        ]
        let completeUrl = baseUrl.appending(endpoint)
        return HTTPClient().requestData(url: completeUrl, method: .post, parameters: contract.toJSON(), headers: headers)
    }
    
    func requestReportList() -> Promise<[Report]> {
        var endpoint = "/reports"
        #if MOCK
        endpoint = "/5db083182f000004cbc13c80"
        #endif
        let completeUrl = baseUrl.appending(endpoint)
        return HTTPClient().request(url: completeUrl, method: .get, parseAs: [Report].self)
    }
}
