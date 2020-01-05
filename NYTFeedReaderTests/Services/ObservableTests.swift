//
//  ObservableTests.swift
//  NYTFeedReaderTests
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import XCTest

@testable import NYTFeedReader
class ObservableTests: XCTestCase {

    // MARK: - Init
    
    func test_Init_GivenValue_SetsValue() {
        let randomString = UUID().description
        
        let sut = stringObservable(withValue: randomString)
        
        XCTAssertEqual(randomString, sut.value)
    }
    
    // MARK: - Bind
    
    func test_BindAndNotify_WhenBinded_GetsNotified() {
        let randomString = UUID().description
        
        let expectation = XCTestExpectation(description: "Initial value is notified")
        
        let sut = stringObservable(withValue: randomString)
        sut.bindAndNotify { value in
            XCTAssertEqual(randomString, value)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func test_Bind_WhenValueChanges_GetsNotified() {
        let randomString = UUID().description
        
        let expectation = XCTestExpectation(description: "Changed value is notified")
        
        let sut = stringObservable(withValue: randomString)
        sut.bind { value in
            XCTAssertNotEqual(randomString, value)
            expectation.fulfill()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 1...4)) {
            sut.value = UUID().description
        }
        
        wait(for: [expectation], timeout: 5)
    }

    // MARK: - Helpers
    
    private func stringObservable(
        withValue value: String = UUID().description) -> Observable<String> {
        return Observable<String>(value: value)
    }
}

