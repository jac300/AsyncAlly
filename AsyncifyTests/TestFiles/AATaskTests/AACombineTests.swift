//
//  AACombineTests.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/5/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import XCTest
@testable import Asyncify

class AACombineTests: XCTestCase {

    func test_combine_1() {

        //Combine [Int], String
        let expectation = XCTestExpectation(description: "test_combine_1")

        Asyncify.combine(AAMockZips.zip_3_int, AAMockTasks.mockSuccess1, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")

            XCTAssertTrue(value.0[0] == 6, "Int with value 6 was stored in the .0[0] position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 7 was stored in the .0[1] position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the .0[2] position.")

            XCTAssertTrue(value.1 == "1", "String with value 1 was stored in the .1 position.")
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }
    func test_combine_2() {

        //Combine [Int], [String], String
        let expectation = XCTestExpectation(description: "test_combine_2")

        Asyncify.combine(AAMockZips.zip_3_int, AAMockZips.zip_2_str, AAMockTasks.mockSuccess1, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")

            XCTAssertTrue(value.0[0] == 6, "Int with value 6 was stored in the .0[0] position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 7 was stored in the .0[1] position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the .0[2] position.")

            XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the .1[0] position.")
            XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the .1[1] position.")

            XCTAssertTrue(value.2 == "1", "String with value 1 was stored in the .2 position.")
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_combine_3() {

        //Combine [Int], Bool, String
        let expectation = XCTestExpectation(description: "test_combine_3")

        Asyncify.combine(AAMockZips.zip_3_int, AAMockTasks.mockSuccess11, AAMockTasks.mockSuccess2,
                          completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")

            XCTAssertTrue(value.0[0] == 6, "Int with value 6 was stored in the .0[0] position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 7 was stored in the .0[1] position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the .0[2] position.")

            XCTAssertTrue(value.1 == true, "Bool with value true was stored in the .1 position.")

            XCTAssertTrue(value.2 == "2", "String with value 2 was stored in the .2 position.")
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_combine_4() {

        //Combine [Int], [String], Bool, String
        let expectation = XCTestExpectation(description: "test_combine_4")

        Asyncify.combine(AAMockZips.zip_3_int, AAMockZips.zip_2_str, AAMockTasks.mockSuccess11, AAMockTasks.mockSuccess2,
                          completion: { value, error in

                            XCTAssertTrue(error.isEmpty, "0 errors produced.")

                            XCTAssertTrue(value.0[0] == 6, "Int with value 6 was stored in the .0[0] position.")
                            XCTAssertTrue(value.0[1] == 7, "Int with value 7 was stored in the .0[1] position.")
                            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the .0[2] position.")

                            XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the .1[0] position.")
                            XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the .1[1] position.")

                            XCTAssertTrue(value.2 == true, "Bool with value true was stored in the .2 position.")

                            XCTAssertTrue(value.3 == "2", "String with value 2 was stored in the .3 position.")
                            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_combine_5() {

        //Merge [Int], String, Int with errors
        let expectation = XCTestExpectation(description: "test_combine_5")

        Asyncify.combine(AAMockZips.zip_1_intArr, AAMockTasks.mockFailure1, AAMockTasks.mockFailure2,
                         completion: { value, error in

                            XCTAssertTrue(error.count == 1, "1 errors produced.")

                            XCTAssertNil(value.0[0], "nil was stored in the .0[0] position.")
                            XCTAssertNil(value.1, "nil was stored in the .1 position.")
                            XCTAssertNil(value.2, "nil was stored in the .2 position.")
                            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }
}

