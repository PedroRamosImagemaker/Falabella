//
//  NetworkingRouter.swift
//  falabella
//
//  Created by Image Maker on 2/10/21.
//

import Foundation
import Alamofire

public typealias NetworkingRouterCompletion = (_ data: Data?, _ response: HTTPURLResponse?, _ error: Error?) -> Void

protocol NetworkingRouterProtocol: Any {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkingRouterCompletion)
}

protocol NetworkingBaseRouterProtocol {
    associatedtype Router: NetworkingRouterProtocol
    var router: Router { get set }
}

class NetworkingRouter<EndPoint: EndPointType>: NetworkingRouterProtocol {
    func request(_ route: EndPoint, completion: @escaping NetworkingRouterCompletion) {
        let fullURL = route.baseURL.appendingPathComponent(route.path)
        AF.request(fullURL, method: .get ,parameters: route.parameters, headers: route.headers).responseData { response in
            NetworkingLogger.log(request: response.request)
            switch response.result {
            case .success(let data):
                completion(data, response.response, nil)
                break
            case .failure(let error):
                completion(nil, nil, error)
                break
            }
        }
    }
}
