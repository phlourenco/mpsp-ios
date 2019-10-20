//
//  HTTPClient.swift
//  github-bests
//
//  Created by Paulo Lourenço on 03/08/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

class HTTPClient {
    
    enum Errors: Error {
        case unknownStatusCode
        case parseError
        case errorStatusCode(Int)
        case invalidURL
    }
    
    func requestData(url: String, method: HTTPMethod, parameters: [String: Any]? = nil, headers: [String: String]? = nil, encoding: ParameterEncoding = JSONEncoding.default) -> Promise<Data> {
        return Promise<Data> { seal in
            guard let url = URL(string: url) else {
                seal.reject(Errors.invalidURL)
                return
            }
                        
            Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseData(completionHandler: { (response) in
                if let error = response.error {
                    seal.reject(error)
                    return
                }
                
                guard let statusCode = response.response?.statusCode else {
                    seal.reject(Errors.unknownStatusCode)
                    return
                }
                
                switch statusCode {
                case 200..<299:
                    if let data = response.data {
                        seal.fulfill(data)
                    } else {
                        seal.reject(Errors.parseError)
                    }
                default:
                    seal.reject(Errors.errorStatusCode(statusCode))
                }
            })
        }
        
    }
    
    func request<T: Decodable>(url: String, method: HTTPMethod, parameters: [String: Any]? = nil, headers: [String: String]? = nil, encoding: ParameterEncoding = JSONEncoding.default, parseAs object: T.Type, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> Promise<T> {
        return Promise<T> { seal in
            requestData(url: url, method: method, parameters: parameters, headers: headers, encoding: encoding)
            .done { data in
                if let parsedObj = data.parse(asObject: T.self, usingKeyDecodingStrategy: keyDecodingStrategy) {
                    seal.fulfill(parsedObj)
                } else {
                    seal.reject(Errors.parseError)
                }
            }
            .catch { error in
                seal.reject(error)
            }
        }
        
    }
    
}
