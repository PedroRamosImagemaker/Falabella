//
//  MockNetworkingRouter.swift
//  falabellaTests
//
//  Created by Image Maker on 4/10/21.
//

import XCTest
import Alamofire
@testable import falabella

class MockNetworkingRouter<EndPoint: EndPointType>: NetworkingRouterProtocol {
    
    var completionHandler: (Data?, HTTPURLResponse?, Error?)
    private var printEndPointData: Bool = false
    init(completionHandler: (Data?, HTTPURLResponse?, Error?)) {
        self.completionHandler = completionHandler
    }
    
    func request(_ route: EndPoint, completion: @escaping NetworkingRouterCompletion) {
        completion(self.completionHandler.0, self.completionHandler.1, self.completionHandler.2)
    }
}

class MockRouter {
    static var shared = MockRouter()
    
    private init() {}
    
    private func loadJsonData(file: String) -> Data? {
        if let jsonFilePath = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            
            if let jsonData = try? Data(contentsOf: jsonFileURL) {
                return jsonData
            }
        }
        return nil
    }
    
    func createMockSession<T: EndPointType>(fromJsonFile file: String = String(),
                                            andStatusCode code: Int,
                                            andError error: Error? = nil, as type: T.Type = T.self,
                                            headers: HTTPHeaders? = nil) -> MockNetworkingRouter<T> {
        
        let data = file.isEmpty ? nil : loadJsonData(file: file)
        let response = HTTPURLResponse(
            url: URL(string: "TESTUrl")!,
            statusCode: code,
            httpVersion: nil,
            headerFields: headers?.dictionary)
        return MockNetworkingRouter<T>(completionHandler: (data, response, error))
    }
}
