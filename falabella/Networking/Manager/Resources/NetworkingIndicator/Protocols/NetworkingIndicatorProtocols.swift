//
//  NetworkingIndicatorProtocols.swift
//  falabella
//
//  Created by Image Maker on 2/10/21.
//

import Foundation

protocol NetworkingIndicatorAdapterProtocol {
    var service: NetworkingIndicatorServiceProtocol { get set}
    
    func getAll(completion: @escaping (Result<Indicators, Error>) -> Void)
}

protocol NetworkingIndicatorServiceProtocol {
    func requestAll(completion: @escaping NetworkingRouterCompletion)
}
