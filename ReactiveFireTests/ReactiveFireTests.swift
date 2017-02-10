//
//  ReactiveFireTests.swift
//  ReactiveFireTests
//
//  Created by Peter Ovchinnikov on 2/10/17.
//  Copyright © 2017 Crossroad Labs. All rights reserved.
//

import XCTest

import Alamofire
import ReactiveFire

class ReactiveFireTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBasic() {
        let e = self.expectation(description: "OK")
        
        Alamofire.request("https://httpbin.org/get").responseJSON().onSuccess { response in
            print("!@#$#@!@#$%:", response)
            e.fulfill()
        }
        
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
