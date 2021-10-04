//
//  NetworkingIndicatorAdapterTest.swift
//  falabellaTests
//
//  Created by Image Maker on 4/10/21.
//

import XCTest
@testable import falabella

class NetworkingIndicatorAdapterTest: XCTestCase {
    var sut: NetworkingIndicatorAdapter!
    private let json = "GetAllIndicator"
    
    override func setUp() {
        super.setUp()
        sut = NetworkingIndicatorAdapter()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testGetAllIndicatorSuccess() {
        self.setupNetworking(file: json, code: 200)
        
        sut.getAll { result in
            guard case .success(let value) = result else {
                return XCTFail("Expected to be a success but got a failure")
            }
            XCTAssertEqual(value.version, "1.7.0")
        }
    }
    
    func testGetAllIndicatorFailure() {
        self.setupNetworking(code: 500)
        
        sut.getAll { result in
            guard case .failure(let error) = result else {
                return XCTFail("Expected to be a failure but got a success")
            }
            XCTAssertEqual(error.localizedDescription, ErrorNetworking.badRequest.localizedDescription)
        }
    }
    
    private func setupNetworking(file: String = String(), code: Int, error: Error? = nil) {
        let router = MockRouter.shared.createMockSession(fromJsonFile: file, andStatusCode: code, andError: error, as: NetworkingIndicatorAPI.self)
        let service = NetworkingIndicatorService(router)
        sut = NetworkingIndicatorAdapter(service)
    }
}
