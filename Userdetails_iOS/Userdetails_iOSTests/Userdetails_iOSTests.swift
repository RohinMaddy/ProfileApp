//
//  Userdetails_iOSTests.swift
//  Userdetails_iOSTests
//
//  Created by Rohin Madhavan on 08/02/2023.
//

import XCTest
@testable import Userdetails_iOS

final class Userdetails_iOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testAPIWorking()
        {
            let apiManager = APIManager()
            let expectation = XCTestExpectation.init(description: "API call returns success")
            guard let url = URL(string:apiManager.baseURL) else {
                return
            }
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    XCTFail("API call encountered an error")
                } else {
                    expectation.fulfill()
                }
                self.waitForExpectations(timeout: 20)
            })
            task.resume()
        }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
