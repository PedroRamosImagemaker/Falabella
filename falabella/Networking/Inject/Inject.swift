//
//  Inject.swift
//  falabella
//
//  Created by Image Maker on 2/10/21.
//

import Foundation

protocol Injectable {}

@propertyWrapper
struct Inject<T: Injectable> {
    let wrappedValue: T
    
    init() {
        wrappedValue = Resolver.shared.resolve()
    }
}

class Resolver {
    private var storage = [String: Injectable]()
    
    static let shared = Resolver()
    private init() {}
    
    func add<T: Injectable>(_ injectable: T) {
        let key = String(reflecting: injectable)
        storage[key] = injectable
    }
    
    func resolve<T: Injectable>() -> T {
        let key = String(reflecting: T.self)
        
        guard let injectable = storage[key] as? T else {
            fatalError("\(key) has not been added as an injectable object.")
        }
        
        return injectable
    }
}

class DependencyUseCaseManager {
    
    private let getAllIndicatorUseCase: GetAllIndicatorUseCase
    
    init() {
        self.getAllIndicatorUseCase = GetAllIndicatorUseCase()
        addDependencies()
    }
    
    private func addDependencies() {
        let resolver = Resolver.shared
        resolver.add(getAllIndicatorUseCase)
    }
}

class DependencyAdapterManager {
    
    private let networkingIndicatorAdapter: NetworkingIndicatorAdapter
    init() {
        self.networkingIndicatorAdapter = NetworkingIndicatorAdapter()
        addDependencies()
    }
    
    private func addDependencies() {
        let resolver = Resolver.shared
        resolver.add(networkingIndicatorAdapter)
    }
}
