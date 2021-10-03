//
//  NetworkingIndicatorAPI.swift
//  falabella
//
//  Created by Image Maker on 2/10/21.
//

import Foundation
import Alamofire

enum NetworkingIndicatorAPI {
    case getAll
}

extension NetworkingIndicatorAPI: EndPointType {
    var path: String {
        switch self {
        case .getAll:
            return "api"
        }
    }
    
    var parameters: Parameters? {
        nil
    }
}
