//
//  AsyncMergeVariedVoidTests.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/7/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import XCTest
@testable import Asyncify

class AsyncMergeVariedVoidTests: XCTestCase {
    
    func test_void_merge_1_a() {
        
        //Merge [Int], String
        let expectation = XCTestExpectation(description: "test_void_merge_1_a")
        
        Asyncify.merge(AAMockVoidData.merge_3_int, AsyncMockTasks.mockVoidSuccess1, completion: { value, error in
            
            XCTAssertTrue(error.0.isEmpty, "0 errors produced at position .0.")
            XCTAssertNil(error.1, "0 errors produced at position .1.")
            
            XCTAssertTrue(value.0[0] == 6, "Int with value 6 was stored in the .0[0] position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 7 was stored in the .0[1] position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the .0[2] position.")
            
            XCTAssertTrue(value.1 == "1", "String with value 1 was stored in the .1 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_void_merge_1_b() {
        
        //Merge [Int], String
        let expectation = XCTestExpectation(description: "test_void_merge_1_b")
        
        Asyncify.merge(AAMockVoidData.merge_3_int, AsyncMockTasks.mockVoidSuccess1, success: { value in
            
            XCTAssertTrue(value.0[0] == 6, "Int with value 6 was stored in the .0[0] position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 7 was stored in the .0[1] position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the .0[2] position.")
            
            XCTAssertTrue(value.1 == "1", "String with value 1 was stored in the .1 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_void_merge_2_a() {
        
        //Merge [Int], [String], String
        let expectation = XCTestExpectation(description: "test_void_merge_2_a")
        
        Asyncify.merge(AAMockVoidData.merge_3_int, AAMockVoidData.merge_2_str, AsyncMockTasks.mockVoidSuccess1,
                       
                       completion: { value, error in
                        
                        XCTAssertTrue(error.0.isEmpty, "0 errors produced at position .0.")
                        XCTAssertTrue(error.1.isEmpty, "0 errors produced at position .1.")
                        XCTAssertNil(error.2, "0 errors produced at position .2.")
                        
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
    
    func test_void_merge_2_b() {
        
        //Merge [Int], [String], String
        let expectation = XCTestExpectation(description: "test_void_merge_2_b")
        
        Asyncify.merge(AAMockVoidData.merge_3_int, AAMockVoidData.merge_2_str, AsyncMockTasks.mockVoidSuccess1,
                       
                       success: { value in
                        
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
    
    func test_void_merge_3_a() {
        
        //Merge [Int], Bool, String
        let expectation = XCTestExpectation(description: "test_void_merge_3_a")
        
        Asyncify.merge(AAMockVoidData.merge_3_int, AsyncMockTasks.mockVoidSuccess11, AsyncMockTasks.mockVoidSuccess2,
                       completion: { value, error in
                        
                        XCTAssertTrue(error.0.isEmpty, "0 errors produced at position .0.")
                        XCTAssertNil(error.1, "0 errors produced at position .1.")
                        XCTAssertNil(error.2, "0 errors produced at position .2.")
                        
                        XCTAssertTrue(value.0[0] == 6, "Int with value 6 was stored in the .0[0] position.")
                        XCTAssertTrue(value.0[1] == 7, "Int with value 7 was stored in the .0[1] position.")
                        XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the .0[2] position.")
                        
                        XCTAssertTrue(value.1 == true, "Bool with value true was stored in the .1 position.")
                        
                        XCTAssertTrue(value.2 == "2", "String with value 2 was stored in the .2 position.")
                        
                        expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_void_merge_3_b() {
        
        //Merge [Int], Bool, String
        let expectation = XCTestExpectation(description: "test_void_merge_3_b")
        
        Asyncify.merge(AAMockVoidData.merge_3_int, AsyncMockTasks.mockVoidSuccess11, AsyncMockTasks.mockVoidSuccess2,
                       success: { value in
                        
                        XCTAssertTrue(value.0[0] == 6, "Int with value 6 was stored in the .0[0] position.")
                        XCTAssertTrue(value.0[1] == 7, "Int with value 7 was stored in the .0[1] position.")
                        XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the .0[2] position.")
                        
                        XCTAssertTrue(value.1 == true, "Bool with value true was stored in the .1 position.")
                        
                        XCTAssertTrue(value.2 == "2", "String with value 2 was stored in the .2 position.")
                        
                        expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_void_merge_4_a() {
        
        //Merge [Int], [String], Bool, String
        let expectation = XCTestExpectation(description: "test_void_merge_4_a")
        
        Asyncify.merge(AAMockVoidData.merge_3_int, AAMockVoidData.merge_2_str, AsyncMockTasks.mockVoidSuccess11,
                       AsyncMockTasks.mockVoidSuccess2, completion: { value, error in
                        
                        XCTAssertTrue(error.0.isEmpty, "0 errors produced at position .0.")
                        XCTAssertTrue(error.1.isEmpty, "0 errors produced at position .1.")
                        XCTAssertNil(error.2, "0 errors produced at the .0 position.")
                        XCTAssertNil(error.3, "0 errors produced at the .0 position.")
                        
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
    
    func test_void_merge_4_b() {
        
        //Merge [Int], [String], Bool, String
        let expectation = XCTestExpectation(description: "test_void_merge_4_b")
        
        Asyncify.merge(AAMockVoidData.merge_3_int, AAMockVoidData.merge_2_str, AsyncMockTasks.mockVoidSuccess11,
                       AsyncMockTasks.mockVoidSuccess2, success: { value in
                        
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
    
    func test_void_merge_5_a() {
        
        //Merge [Int], String, Int with errors
        let expectation = XCTestExpectation(description: "test_void_merge_5_a")
        
        Asyncify.merge(AAMockVoidData.merge_1_intArr, AsyncMockTasks.mockVoidFailure1,
                       AsyncMockTasks.mockVoidFailure2, completion: { value, error in
                        
                        XCTAssertNotNil(error.0[0], "1 error produced at position .0[0].")
                        XCTAssertNil(error.1, "0 errors produced at the .1 position.")
                        XCTAssertNil(error.2, "0 errors produced at the .2 position.")
                        
                        XCTAssertNil(value.0[0], "nil was stored in the .0[0] position.")
                        XCTAssertNil(value.1, "nil was stored in the .1 position.")
                        XCTAssertNil(value.2, "nil was stored in the .2 position.")

                        expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_void_merge_5_b() {
        
        //Merge [Int], String, Int with errors
        let expectation = XCTestExpectation(description: "test_void_merge_5_b")
        
        Asyncify.merge(AAMockVoidData.merge_1_intArr, AsyncMockTasks.mockVoidFailure1,
                       AsyncMockTasks.mockVoidFailure2,
                       failure: { error in
                        
                        XCTAssertNotNil(error.0[0], "1 error produced at position .0[0].")
                        XCTAssertNil(error.1, "0 errors produced at the .1 position.")
                        XCTAssertNil(error.2, "0 errors produced at the .2 position.")

                        expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
}
