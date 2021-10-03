//
//  NetworkingIndicatorAdapter.swift
//  falabella
//
//  Created by Image Maker on 2/10/21.
//

import Foundation

class NetworkingIndicatorAdapter: DefaultNetworkManager, NetworkingIndicatorAdapterProtocol, Injectable {
    var service: NetworkingIndicatorServiceProtocol
    
    init(_ service: NetworkingIndicatorServiceProtocol = NetworkingIndicatorService(NetworkingRouter<NetworkingIndicatorAPI>())) {
        self.service = service
    }
    
    func getAll(completion: @escaping (Result<Indicators, Error>) -> Void) {
        service.requestAll { [weak self] (data, response, error) in
            error.map { completion(.failure($0)) }
            guard let self = self else {
                completion(.failure(ErrorNetworking.failed))
                return
            }
            response.map {
                switch self.handleNetwork($0) {
                case .success:
                    do {
                        let content: Indicators = try self.load(data: data)
                        completion(.success(content))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
