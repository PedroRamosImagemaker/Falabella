//
//  EndPointType.swift
//  falabella
//
//  Created by Image Maker on 2/10/21.
//

import Foundation
import Alamofire

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get}
}

extension EndPointType {
    private var environmentBaseURl: String {
        return Environment.baseURL
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURl) else { fatalError("baseURL could not be configured.") }
        return url
    }

    func encode<T>(_ value: T) -> Data? where T : Encodable {
        do {
            return try JSONEncoder().encode(value)
        } catch {
            Logger.warning("ENCODE ERROR PARSE DATA \(error)")
            return nil
        }
    }

    var headers: HTTPHeaders? {
        return ["Content-Type": "application/json"]
    }
}
