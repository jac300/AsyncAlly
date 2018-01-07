//
//  AAMergeTests.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/5/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import XCTest
@testable import AsyncAlly

class AAMergeTests: XCTestCase {

    func test_merge_1() {

        //Merge String, Int
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

        //Merge String, Int, Bool
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

        //Merge String, Int, Bool, Int
        let expectation = XCTestExpectation(description: "test_merge_3")

        AsyncAlly.merge(AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockSuccess6,
                        AAMockTaskObjects.mockSuccess9, AAMockTaskObjects.mockSuccess7, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")

            XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
            XCTAssertTrue(value.1 == 6, "Int with value 6 was stored in the .1 position.")
            XCTAssertTrue(value.2 == true, "Bool with value true was stored in the .2 position.")
            XCTAssertTrue(value.3 == 7, "Int with value 7 was stored in the .3 position.")

            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_merge_4() {

        //Merge String, Int, Bool, Int
        let expectation = XCTestExpectation(description: "test_merge_4")

        AsyncAlly.merge(AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockSuccess6,
                        AAMockTaskObjects.mockSuccess9, AAMockTaskObjects.mockSuccess10, AAMockTaskObjects.mockSuccess7, completion: { value, error in

                            XCTAssertTrue(error.isEmpty, "0 errors produced.")

                            XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
                            XCTAssertTrue(value.1 == 6, "Int with value 6 was stored in the .1 position.")
                            XCTAssertTrue(value.2 == true, "Bool with value true was stored in the .2 position.")
                            XCTAssertTrue(value.3 == false, "Bool with value false was stored in the .3 position.")
                            XCTAssertTrue(value.4 == 7, "Int with value 7 was stored in the .4 position.")
                            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_merge_6() {

        //Merge String, Int, Bool, Int, String with errors
        let expectation = XCTestExpectation(description: "test_merge_6")

        AsyncAlly.merge(AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockFailure2,
                        AAMockTaskObjects.mockFailure3, AAMockTaskObjects.mockSuccess6, AAMockTaskObjects.mockSuccess2, completion: { value, error in

                            XCTAssertTrue(error.isEmpty, "0 errors produced.")

                            XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
                            XCTAssertNil(value.1, "nil was stored in the .1 position.")
                            XCTAssertNil(value.2, "nil was stored in the .2 position.")
                            XCTAssertTrue(value.3 == 6, "Int with value 6 was stored in the .3 position.")
                            XCTAssertTrue(value.4 == "2", "String with value 2 was stored in the .4 position.")
                            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_merge_7() {

        //Merge String, Int, Bool with errors
        let expectation = XCTestExpectation(description: "test_merge_7")

        AsyncAlly.merge(AAMockTaskObjects.mockFailure1, AAMockTaskObjects.mockFailure2,
                        AAMockTaskObjects.mockFailure3, completion: { value, error in

                            XCTAssertTrue(error.isEmpty, "0 errors produced.")

                            XCTAssertNil(value.0, "nil was stored in the .0 position.")
                            XCTAssertNil(value.1, "nil was stored in the .1 position.")
                            XCTAssertNil(value.2, "nil was stored in the .2 position.")
                            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }
}
