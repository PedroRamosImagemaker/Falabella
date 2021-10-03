//
//  GetAllIndicatorUseCase.swift
//  falabella
//
//  Created by Image Maker on 2/10/21.
//

import Foundation

typealias GetAllIndicatorDataClosure = (_ result: Result<Indicators, Error>) -> Void

final class GetAllIndicatorUseCase: Injectable {
    @Inject private var adapter: NetworkingIndicatorAdapter
    
    func execute(completion: @escaping GetAllIndicatorDataClosure) {
        adapter.getAll(completion: completion)
    }
}
