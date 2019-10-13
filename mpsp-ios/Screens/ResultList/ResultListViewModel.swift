//
//  ResultListViewModel.swift
//  mpsp-ios
//
//  Created by Paulo Lourenço on 10/10/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation
import Alamofire

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
        
        for req in requests {
            print(req.toJSON() ?? "")
            print("-----------")
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.responses[0].status = .error
//            self.responses[2].status = .success
//        }
    }
    
    
    
}
