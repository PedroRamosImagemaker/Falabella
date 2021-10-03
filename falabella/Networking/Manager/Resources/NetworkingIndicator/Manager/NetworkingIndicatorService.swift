//
//  NetworkingIndicatorService.swift
//  falabella
//
//  Created by Image Maker on 2/10/21.
//

import Foundation

class NetworkingIndicatorService<Router: NetworkingRouterProtocol>: NetworkingBaseRouterProtocol, NetworkingIndicatorServiceProtocol where Router.EndPoint == NetworkingIndicatorAPI {
    var router: Router
    
    init(_ router: Router) {
        self.router = router
    }
    
    func requestAll(completion: @escaping NetworkingRouterCompletion) {
        router.request(.getAll) { completion($0, $1, $2) }
    }
}
