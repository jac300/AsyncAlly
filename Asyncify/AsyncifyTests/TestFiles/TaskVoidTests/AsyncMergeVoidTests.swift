//
//  ASyncMergeVoidTests.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/7/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import XCTest
@testable import Asyncify

class ASyncMergeVoidTests: XCTestCase {

    func test_void_merge_1() {

        //Merge String, Int
        let expectation = XCTestExpectation(description: "test_void_merge_1")

        Asyncify.merge(AsyncMockTasks.mockVoidSuccess1, AsyncMockTasks.mockVoidSuccess6, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")

            XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
            XCTAssertTrue(value.1 == 6, "Int with value 6 was stored in the .1 position.")
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_void_merge_2() {

        //Merge String, Int, Bool
        let expectation = XCTestExpectation(description: "test_void_merge_2")

        Asyncify.merge(AsyncMockTasks.mockVoidSuccess1, AsyncMockTasks.mockVoidSuccess6,
                       AsyncMockTasks.mockVoidSuccess10, completion: { value, error in

                        XCTAssertTrue(error.isEmpty, "0 errors produced.")

                        XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
                        XCTAssertTrue(value.1 == 6, "Int with value 6 was stored in the .1 position.")
                        XCTAssertTrue(value.2 == false, "Bool with value false was stored in the .2 position.")

                        expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_void_merge_3() {

        //Merge String, Int, Bool, Int
        let expectation = XCTestExpectation(description: "test_void_merge_3")

        Asyncify.merge(AsyncMockTasks.mockVoidSuccess1, AsyncMockTasks.mockVoidSuccess6,
                       AsyncMockTasks.mockVoidSuccess9, AsyncMockTasks.mockVoidSuccess7, completion: { value, error in

                        XCTAssertTrue(error.isEmpty, "0 errors produced.")

                        XCTAssertTrue(value.0 == "1", "String with value 1 was stored in the .0 position.")
                        XCTAssertTrue(value.1 == 6, "Int with value 6 was stored in the .1 position.")
                        XCTAssertTrue(value.2 == true, "Bool with value true was stored in the .2 position.")
                        XCTAssertTrue(value.3 == 7, "Int with value 7 was stored in the .3 position.")

                        expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_void_merge_4() {

        //Merge String, Int, Bool, Int
        let expectation = XCTestExpectation(description: "test_void_merge_4")

        Asyncify.merge(AsyncMockTasks.mockVoidSuccess1, AsyncMockTasks.mockVoidSuccess6,
                       AsyncMockTasks.mockVoidSuccess9, AsyncMockTasks.mockVoidSuccess10, AsyncMockTasks.mockVoidSuccess7, completion: { value, error in

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

    func test_void_merge_5() {

        //Merge String, Int, Bool, Int, String with errors
        let expectation = XCTestExpectation(description: "test_void_merge_5")

        Asyncify.merge(AsyncMockTasks.mockVoidSuccess1, AsyncMockTasks.mockVoidFailure2,
                       AsyncMockTasks.mockVoidFailure3, AsyncMockTasks.mockVoidSuccess6, AsyncMockTasks.mockVoidSuccess2, completion: { value, error in

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

    func test_void_merge_6() {

        //Merge String, Int, Bool with errors
        let expectation = XCTestExpectation(description: "test_void_merge_6")

        Asyncify.merge(AsyncMockTasks.mockVoidFailure1, AsyncMockTasks.mockVoidFailure2,
                       AsyncMockTasks.mockVoidFailure3, completion: { value, error in

                        XCTAssertTrue(error.isEmpty, "0 errors produced.")

                        XCTAssertNil(value.0, "nil was stored in the .0 position.")
                        XCTAssertNil(value.1, "nil was stored in the .1 position.")
                        XCTAssertNil(value.2, "nil was stored in the .2 position.")
                        expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }
}
