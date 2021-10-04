//
//  GetAllIndicatorUseCaseTest.swift
//  falabellaTests
//
//  Created by Image Maker on 4/10/21.
//

import XCTest
@testable import falabella

class GetAllIndicatorUseCaseTest: XCTestCase {

    var sut: GetAllIndicatorUseCase!
    
    override func setUp() {
        super.setUp()
        sut = GetAllIndicatorUseCase()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testSuccess() {
        sut.execute { result in
            guard case .success(let value) = result else {
                return XCTFail("Expected to be a success but got a failure")
            }
            XCTAssertEqual(value.version, "1.7.0")
        }
    }
}
