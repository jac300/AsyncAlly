//
//  AsyncAllyTests.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/5/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import XCTest
@testable import AsyncAlly

class AsyncAllyMergeTests: XCTestCase {

    func test_merge_1() {

        //Zip String, Int
        let expectation = XCTestExpectation(description: "test_merge_1")

        AsyncAlly.merge(AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockSuccess6, completion: { value, error in

                            XCTAssertTrue(error.isEmpty, "0 errors produced.")

                            XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
                            XCTAssertTrue(value.1 == 6, "Int with value 6 was stored in the .1 position.")
                            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_merge_2() {

        //Zip String, Int, Bool
        let expectation = XCTestExpectation(description: "test_merge_2")

        AsyncAlly.merge(AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockSuccess6,
                        AAMockTaskObjects.mockSuccess10, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")

            XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
            XCTAssertTrue(value.1 == 6, "Int with value 6 was stored in the .1 position.")
            XCTAssertTrue(value.2 == false, "Bool with value false was stored in the .2 position.")

            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_merge_3() {

        //Zip String, Int, Bool, [String]
        let expectation = XCTestExpectation(description: "test_merge_3")

        AsyncAlly.merge(AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockSuccess6,
                        AAMockTaskObjects.mockSuccess9, AAMockTaskObjects.mockSuccess13, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")

            XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
            XCTAssertTrue(value.1 == 6, "Int with value 6 was stored in the .1 position.")
            XCTAssertTrue(value.2 == true, "Bool with value true was stored in the .2 position.")
            XCTAssertTrue(value.3?[0] == "13", "[String] with value [13] was stored in the .2 position.")

            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_merge_4() {

        //Zip String, Int, Bool, [String], [Int]
        let expectation = XCTestExpectation(description: "test_merge_4")

        AsyncAlly.merge(AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockSuccess6,
                        AAMockTaskObjects.mockSuccess9, AAMockTaskObjects.mockSuccess12, AAMockTaskObjects.mockSuccess16, completion: { value, error in

                            XCTAssertTrue(error.isEmpty, "0 errors produced.")

                            XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
                            XCTAssertTrue(value.1 == 6, "Int with value 6 was stored in the .1 position.")
                            XCTAssertTrue(value.2 == true, "Bool with value true was stored in the .2 position.")
                            XCTAssertTrue(value.3?[0] == "12", "[String] with value [12] was stored in the .3 position.")
                            XCTAssertTrue(value.4?[0] == 16, "Bool with value true was stored in the .4 position.")
                            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_merge_5() {

        //Zip String, Int, Bool, [String], [Int] with errors
        let expectation = XCTestExpectation(description: "test_merge_5")

        AsyncAlly.merge(AAMockTaskObjects.mockFailure1, AAMockTaskObjects.mockFailure2,
                        AAMockTaskObjects.mockFailure3, AAMockTaskObjects.mockFailure4, AAMockTaskObjects.mockFailure5, completion: { value, error in

                            XCTAssertTrue(error.count == 2, "2 errors produced.")

                            XCTAssertNil(value.0, "nil was stored in the .0 position.")
                            XCTAssertNil(value.1, "nil was stored in the .1 position.")
                            XCTAssertNil(value.2, "nil was stored in the .2 position.")
                            XCTAssertNil(value.3, "nil was stored in the .3 position.")
                            XCTAssertNil(value.4, "nil was stored in the .4 position.")
                            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_merge_6() {

        //Zip String, Int, Bool, Int, [String] with errors
        let expectation = XCTestExpectation(description: "test_merge_6")

        AsyncAlly.merge(AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockFailure2,
                        AAMockTaskObjects.mockFailure3, AAMockTaskObjects.mockSuccess6, AAMockTaskObjects.mockSuccess12, completion: { value, error in

                            XCTAssertTrue(error.isEmpty, "0 errors produced.")

                            XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
                            XCTAssertNil(value.1, "nil was stored in the .1 position.")
                            XCTAssertNil(value.2, "nil was stored in the .2 position.")
                            XCTAssertTrue(value.3 == 6, "Int with value 6 was stored in the .3 position.")
                            XCTAssertTrue(value.4?[0] == "12", "[String] with value [12] was stored in the .4 position.")
                            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }
}
