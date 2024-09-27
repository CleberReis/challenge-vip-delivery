//
//  SettingsWorkerTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Cleber Reis on 02/02/22.
//

import Foundation
import XCTest

@testable import DeliveryAppChallenge

class SettingsWorkerTests: XCTestCase {
    private let networkSpy = NetworkManagerProtocolSpy()
    private lazy var sut = SettingsWorker(network: networkSpy)
    
    func test_fetchSettingsData_givenNetworkResultSuccess_shouldReturnSuccess() {
        //Given
        let response = SettingsResponse.init(name: "Cleber",
                                             email: "teste@teste.com",
                                             address: "Rua teste",
                                             paymentMethod: "Cartão")
        networkSpy.requestToBeReturned = Result<SettingsResponse, Error>.success(response)
        
        var expectedResult: Result<SettingsResponse, Error>?
        
        //When
        sut.fetchSettingsData { result in
            expectedResult = result
        }
        
        //Then
        switch expectedResult {
            case .success(let response):
                XCTAssertNotNil(response)
            default:
                XCTFail("expectedResult should be success")
        }
        
        XCTAssertTrue(networkSpy.requestCalled)
        XCTAssertNotNil(networkSpy.requestPassed as? SettingsRequest)
    }
    
    func test_fetchSettingsData_givenNetworkResultFailure_shouldReturnFailure() {
        
        networkSpy.requestToBeReturned = Result<SettingsResponse, Error>.failure(ErrorDummy())
        
        var expectedResult: Result<SettingsResponse, Error>?
        
        sut.fetchSettingsData { result in
            expectedResult = result
        }
        
        switch expectedResult {
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertNotNil(error as? ErrorDummy)
            default:
                XCTFail("expectedResult should be error")
        }
        
        XCTAssertTrue(networkSpy.requestCalled)
        XCTAssertNotNil(networkSpy.requestPassed as? SettingsRequest)
        
    }
    
}
