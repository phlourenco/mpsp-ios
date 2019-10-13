//
//  ResultListViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 10/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class ResultListViewModel {
    
    private let view: ResultListView
    private let requests: [RequestBase]
    private var responses: [ServiceResponse] = [] {
        didSet {
            view.showList(responses)
        }
    }
    
    init(view: ResultListView, requests: [RequestBase]) {
        self.view = view
        self.requests = requests
        
        responses = requests.map { ServiceResponse(request: $0, status: .loading, response: nil) }
    }
    
    func makeRequests() {
        view.showList(responses)
        
        for (i, e) in requests.enumerated() {
            
            self.responses[i].status = .loading
            
            MPSPApi().requestService(endpoint: e.getEndpoint(), contract: e)
                .done { data in
                    self.responses[i].status = .success
                    print(data)
                    print(type(of: data))
                }
                .catch { error in
                    self.responses[i].status = .error
                }
        }
        
    }
    
    
    
}
