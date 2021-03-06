//
//  AsyncMergeArrTests.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/5/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import XCTest
@testable import Asyncify

class AsyncMergeArrTests: XCTestCase {
    
    func test_merge_1_a() {
        
        //Merge 3 String
        let expectation = XCTestExpectation(description: "test_merge_1_a")
        
        Asyncify.merge(AsyncMockData.merge_3_str, completion: { value, error in
            
            XCTAssertTrue(error.isEmpty, "0 errors produced.")

            XCTAssertTrue(value.count == 3, "3 String values were produced.")
            
            XCTAssertTrue(value[0] == "1", "String with value 1 was stored in the 0 position.")
            XCTAssertTrue(value[1] == "2", "String with value 2 was stored in the 1 position.")
            XCTAssertTrue(value[2] == "3", "String with value 3 was stored in the 2 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_1_b() {
        
        //Merge 3 String
        let expectation = XCTestExpectation(description: "test_merge_1_b")
        
        Asyncify.merge(AsyncMockData.merge_3_str, success: { value in
            
            XCTAssertTrue(value.count == 3, "3 String values were produced.")
            
            XCTAssertTrue(value[0] == "1", "String with value 1 was stored in the 0 position.")
            XCTAssertTrue(value[1] == "2", "String with value 2 was stored in the 1 position.")
            XCTAssertTrue(value[2] == "3", "String with value 3 was stored in the 2 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_2_a() {
        
        //Merge 5 String
        let expectation = XCTestExpectation(description: "test_merge_2_a")
        
        Asyncify.merge(AsyncMockData.merge_5_str, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")

            XCTAssertTrue(value.count == 5, "5 String values were produced.")
            
            XCTAssertTrue(value[0] == "1", "String with value 1 was stored in the 0 position.")
            XCTAssertTrue(value[1] == "2", "String with value 2 was stored in the 1 position.")
            XCTAssertTrue(value[2] == "3", "String with value 3 was stored in the 2 position.")
            XCTAssertTrue(value[3] == "4", "String with value 4 was stored in the 3 position.")
            XCTAssertTrue(value[4] == "5", "String with value 5 was stored in the 4 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_2_b() {
        
        //Merge 5 String
        let expectation = XCTestExpectation(description: "test_merge_2_b")
        
        Asyncify.merge(AsyncMockData.merge_5_str, success: { value in
            
            XCTAssertTrue(value.count == 5, "5 String values were produced.")
            
            XCTAssertTrue(value[0] == "1", "String with value 1 was stored in the 0 position.")
            XCTAssertTrue(value[1] == "2", "String with value 2 was stored in the 1 position.")
            XCTAssertTrue(value[2] == "3", "String with value 3 was stored in the 2 position.")
            XCTAssertTrue(value[3] == "4", "String with value 4 was stored in the 3 position.")
            XCTAssertTrue(value[4] == "5", "String with value 5 was stored in the 4 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_3_a() {
        
        //Merge 3 Int, 2 String
        let expectation = XCTestExpectation(description: "test_merge_3_a")
        
        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_2_str, completion: { value, error in
            
            XCTAssertTrue(error[0].isEmpty, "0 errors produced at [0].")
            XCTAssertTrue(error[1].isEmpty, "0 errors produced at [1].")

            XCTAssertTrue(value.0.count == 3, "3 Int values were produced.")
            XCTAssertTrue(value.1.count == 2, "2 String values were produced.")
            
            XCTAssertTrue(value.0[0] == 6, "Int with value 4 was stored in the 0.0 position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 5 was stored in the 0.1 position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the 0.2 position.")
            
            XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the 1.1 position.")
            XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the 1.2 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_3_b() {
        
        //Merge 3 Int, 2 String
        let expectation = XCTestExpectation(description: "test_merge_3_b")
        
        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_2_str, success: { value in
            
            XCTAssertTrue(value.0.count == 3, "3 Int values were produced.")
            XCTAssertTrue(value.1.count == 2, "2 String values were produced.")
            
            XCTAssertTrue(value.0[0] == 6, "Int with value 4 was stored in the 0.0 position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 5 was stored in the 0.1 position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the 0.2 position.")
            
            XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the 1.1 position.")
            XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the 1.2 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_4_a() {
        
        //Merge 3 Int, 2 String, 3 Bool
        let expectation = XCTestExpectation(description: "test_merge_4_a")
        
        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_2_str, AsyncMockData.merge_3_bool, completion: { value, error in
            
            XCTAssertTrue(error[0].isEmpty, "0 errors produced at [0].")
            XCTAssertTrue(error[1].isEmpty, "0 errors produced at [1].")
            XCTAssertTrue(error[2].isEmpty, "0 errors produced at [2].")

            XCTAssertTrue(value.0.count == 3, "3 Int values were produced.")
            XCTAssertTrue(value.1.count == 2, "2 String values were produced.")
            XCTAssertTrue(value.2.count == 3, "3 Bool values were produced.")
            
            XCTAssertTrue(value.0[0] == 6, "Int with value 4 was stored in the 0.0 position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 5 was stored in the 0.1 position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the 0.2 position.")
            
            XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the 1.1 position.")
            XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the 1.2 position.")
            
            XCTAssertTrue(value.2[0] == true, "Bool with value true was stored in the 2.0 position.")
            XCTAssertTrue(value.2[1] == false, "String with value true was stored in the 2.1 position.")
            XCTAssertTrue(value.2[2] == true, "String with value true was stored in the 2.2 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_4_b() {
        
        //Merge 3 Int, 2 String, 3 Bool
        let expectation = XCTestExpectation(description: "test_merge_4_b")
        
        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_2_str, AsyncMockData.merge_3_bool, success: { value in
            
            XCTAssertTrue(value.0.count == 3, "3 Int values were produced.")
            XCTAssertTrue(value.1.count == 2, "2 String values were produced.")
            XCTAssertTrue(value.2.count == 3, "3 Bool values were produced.")
            
            XCTAssertTrue(value.0[0] == 6, "Int with value 4 was stored in the 0.0 position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 5 was stored in the 0.1 position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the 0.2 position.")
            
            XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the 1.1 position.")
            XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the 1.2 position.")
            
            XCTAssertTrue(value.2[0] == true, "Bool with value true was stored in the 2.0 position.")
            XCTAssertTrue(value.2[1] == false, "String with value true was stored in the 2.1 position.")
            XCTAssertTrue(value.2[2] == true, "String with value true was stored in the 2.2 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_5_a() {
        
        //Merge 3 Int, 2 String, 3 Bool, 3 [String]
        let expectation = XCTestExpectation(description: "test_merge_5_a")
        
        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_2_str, AsyncMockData.merge_3_bool, AsyncMockData.merge_3_strArr, completion: { value, error in
            
            XCTAssertTrue(error[0].isEmpty, "0 errors produced at [0].")
            XCTAssertTrue(error[1].isEmpty, "0 errors produced at [1].")
            XCTAssertTrue(error[2].isEmpty, "0 errors produced at [2].")
            XCTAssertTrue(error[3].isEmpty, "0 errors produced at [3].")

            XCTAssertTrue(value.0.count == 3, "3 Int values were produced.")
            XCTAssertTrue(value.1.count == 2, "2 String values were produced.")
            XCTAssertTrue(value.2.count == 3, "3 Bool values were produced.")
            XCTAssertTrue(value.3.count == 3, "3 [String] values were produced.")
            
            XCTAssertTrue(value.0[0] == 6, "Int with value 4 was stored in the 0.0 position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 5 was stored in the 0.1 position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the 0.2 position.")
            
            XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the 1.1 position.")
            XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the 1.2 position.")
            
            XCTAssertTrue(value.2[0] == true, "Bool with value true was stored in the 2.0 position.")
            XCTAssertTrue(value.2[1] == false, "String with value true was stored in the 2.1 position.")
            XCTAssertTrue(value.2[2] == true, "String with value true was stored in the 2.2 position.")
            
            XCTAssertTrue(value.3[0]?[0] == "12", "[String] with value [12] was stored in the 3.0 position.")
            XCTAssertTrue(value.3[1]?[0] == "13", "[String] with value [13] was stored in the 3.1 position.")
            XCTAssertTrue(value.3[2]?[0] == "14", "[String] with value [14] was stored in the 3.2 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_5_b() {
        
        //Merge 3 Int, 2 String, 3 Bool, 3 [String]
        let expectation = XCTestExpectation(description: "test_merge_5_b")
        
        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_2_str, AsyncMockData.merge_3_bool, AsyncMockData.merge_3_strArr, success: { value in
            
            XCTAssertTrue(value.0.count == 3, "3 Int values were produced.")
            XCTAssertTrue(value.1.count == 2, "2 String values were produced.")
            XCTAssertTrue(value.2.count == 3, "3 Bool values were produced.")
            XCTAssertTrue(value.3.count == 3, "3 [String] values were produced.")
            
            XCTAssertTrue(value.0[0] == 6, "Int with value 4 was stored in the 0.0 position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 5 was stored in the 0.1 position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the 0.2 position.")
            
            XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the 1.1 position.")
            XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the 1.2 position.")
            
            XCTAssertTrue(value.2[0] == true, "Bool with value true was stored in the 2.0 position.")
            XCTAssertTrue(value.2[1] == false, "String with value true was stored in the 2.1 position.")
            XCTAssertTrue(value.2[2] == true, "String with value true was stored in the 2.2 position.")
            
            XCTAssertTrue(value.3[0][0] == "12", "[String] with value [12] was stored in the 3.0 position.")
            XCTAssertTrue(value.3[1][0] == "13", "[String] with value [13] was stored in the 3.1 position.")
            XCTAssertTrue(value.3[2][0] == "14", "[String] with value [14] was stored in the 3.2 position.")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_6_a() {
        
        //Merge 3 Int, 2 String, 3 Bool, 3 [String], 2 [Int]
        let expectation = XCTestExpectation(description: "test_merge_6_a")
        
        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_2_str, AsyncMockData.merge_3_bool, AsyncMockData.merge_3_strArr, AsyncMockData.merge_2_intArr,
                       completion: { value, error in
                        
                        XCTAssertTrue(error[0].isEmpty, "0 errors produced at [0].")
                        XCTAssertTrue(error[1].isEmpty, "0 errors produced at [1].")
                        XCTAssertTrue(error[2].isEmpty, "0 errors produced at [2].")
                        XCTAssertTrue(error[3].isEmpty, "0 errors produced at [3].")
                        XCTAssertTrue(error[4].isEmpty, "0 errors produced at [4].")

                        XCTAssertTrue(value.0.count == 3, "3 Int values were produced.")
                        XCTAssertTrue(value.1.count == 2, "2 String values were produced.")
                        XCTAssertTrue(value.2.count == 3, "3 Bool values were produced.")
                        XCTAssertTrue(value.3.count == 3, "3 [String] values were produced.")
                        XCTAssertTrue(value.4.count == 2, "2 [Int] values were produced.")
                        
                        XCTAssertTrue(value.0[0] == 6, "Int with value 4 was stored in the 0.0 position.")
                        XCTAssertTrue(value.0[1] == 7, "Int with value 5 was stored in the 0.1 position.")
                        XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the 0.2 position.")
                        
                        XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the 1.1 position.")
                        XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the 1.2 position.")
                        
                        XCTAssertTrue(value.2[0] == true, "Bool with value true was stored in the 2.0 position.")
                        XCTAssertTrue(value.2[1] == false, "String with value true was stored in the 2.1 position.")
                        XCTAssertTrue(value.2[2] == true, "String with value true was stored in the 2.2 position.")
                        
                        XCTAssertTrue(value.3[0]?[0] == "12", "[String] with value [12] was stored in the 3.0 position.")
                        XCTAssertTrue(value.3[1]?[0] == "13", "[String] with value [13] was stored in the 3.1 position.")
                        XCTAssertTrue(value.3[2]?[0] == "14", "[String] with value [14] was stored in the 3.2 position.")
                        
                        XCTAssertTrue(value.4[0]?[0] == 15, "[Int] with value [15] was stored in the 4.0 position.")
                        XCTAssertTrue(value.4[1]?[0] == 16, "[Int] with value [16] was stored in the 4.1 position.")
                        
                        expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_6_b() {
        
        //Merge 3 Int, 2 String, 3 Bool, 3 [String], 2 [Int]
        let expectation = XCTestExpectation(description: "test_merge_6_b")
        
        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_2_str, AsyncMockData.merge_3_bool, AsyncMockData.merge_3_strArr, AsyncMockData.merge_2_intArr,
                       success: { value in
                        
                        XCTAssertTrue(value.0.count == 3, "3 Int values were produced.")
                        XCTAssertTrue(value.1.count == 2, "2 String values were produced.")
                        XCTAssertTrue(value.2.count == 3, "3 Bool values were produced.")
                        XCTAssertTrue(value.3.count == 3, "3 [String] values were produced.")
                        XCTAssertTrue(value.4.count == 2, "2 [Int] values were produced.")
                        
                        XCTAssertTrue(value.0[0] == 6, "Int with value 4 was stored in the 0.0 position.")
                        XCTAssertTrue(value.0[1] == 7, "Int with value 5 was stored in the 0.1 position.")
                        XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the 0.2 position.")
                        
                        XCTAssertTrue(value.1[0] == "4", "String with value 4 was stored in the 1.1 position.")
                        XCTAssertTrue(value.1[1] == "5", "String with value 5 was stored in the 1.2 position.")
                        
                        XCTAssertTrue(value.2[0] == true, "Bool with value true was stored in the 2.0 position.")
                        XCTAssertTrue(value.2[1] == false, "String with value true was stored in the 2.1 position.")
                        XCTAssertTrue(value.2[2] == true, "String with value true was stored in the 2.2 position.")
                        
                        XCTAssertTrue(value.3[0][0] == "12", "[String] with value [12] was stored in the 3.0 position.")
                        XCTAssertTrue(value.3[1][0] == "13", "[String] with value [13] was stored in the 3.1 position.")
                        XCTAssertTrue(value.3[2][0] == "14", "[String] with value [14] was stored in the 3.2 position.")
                        
                        XCTAssertTrue(value.4[0][0] == 15, "[Int] with value [15] was stored in the 4.0 position.")
                        XCTAssertTrue(value.4[1][0] == 16, "[Int] with value [16] was stored in the 4.1 position.")
                        
                        expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_7_a() {
        
        //Merge 3 Int, 2 String, 3 Bool, 3 [String], 2 [Int] with failures
        let expectation = XCTestExpectation(description: "test_merge_7_a")
        
        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_4_str, AsyncMockData.merge_3_bool, AsyncMockData.merge_4_strArr, AsyncMockData.merge_2_intArr, completion: { value, error in

            XCTAssertTrue(error[0].isEmpty, "0 errors produced at [0].")
            XCTAssertTrue(error[1].isEmpty, "0 errors produced at [1].")
            XCTAssertTrue(error[2].isEmpty, "0 errors produced at [2].")

            XCTAssertNil(error[3][0], "0 errors produced at position [3][0].")
            XCTAssertNil(error[3][1], "0 errors produced at position [3][1].")
            XCTAssertNil(error[3][2], "0 errors produced at position [3][2].")
            XCTAssertNotNil(error[3][3], "1 errors produced at position [3][3].")

            XCTAssertTrue(error[4].isEmpty, "0 errors produced.")

            XCTAssertTrue(value.0.count == 3, "3 Int values were produced.")
            XCTAssertTrue(value.1.count == 4, "3 out of 4 String values were produced plus nil.")
            XCTAssertTrue(value.2.count == 3, "3 Bool values were produced.")
            XCTAssertTrue(value.3.count == 4, "3 out of 4 [String] values were produced plus nil.")
            XCTAssertTrue(value.4.count == 2, "2 [Int] values were produced.")

            XCTAssertTrue(value.0[0] == 6, "Int with value 4 was stored in the 0.0 position.")
            XCTAssertTrue(value.0[1] == 7, "Int with value 5 was stored in the 0.1 position.")
            XCTAssertTrue(value.0[2] == 8, "Int with value 8 was stored in the 0.2 position.")

            XCTAssertTrue(value.1[0] == "3", "String with value 3 was stored in the 1.0 position.")
            XCTAssertTrue(value.1[1] == "4", "String with value 4 was stored in the 1.1 position.")
            XCTAssertNil(value.1[2], "nil was stored in the 1.2 position.")
            XCTAssertTrue(value.1[3] == "5", "String with value 5 was stored in the 1.3 position.")

            XCTAssertTrue(value.2[0] == true, "Bool with value true was stored in the 2.0 position.")
            XCTAssertTrue(value.2[1] == false, "String with value true was stored in the 2.1 position.")
            XCTAssertTrue(value.2[2] == true, "String with value true was stored in the 2.2 position.")

            XCTAssertTrue(value.3[0]?[0] == "12", "[String] with value [12] was stored in the 3.0 position.")
            XCTAssertTrue(value.3[1]?[0] == "13", "[String] with value [13] was stored in the 3.1 position.")
            XCTAssertTrue(value.3[2]?[0] == "14", "[String] with value [14] was stored in the 3.2 position.")
            XCTAssertNil(value.3[3], "nil was stored in the 3.3 position.")

            XCTAssertTrue(value.4[0]?[0] == 15, "[Int] with value [15] was stored in the 4.0 position.")
            XCTAssertTrue(value.4[1]?[0] == 16, "[Int] with value [16] was stored in the 4.1 position.")

            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 100.0)
    }
    
    func test_merge_7_b() {

        //Merge 3 Int, 2 String, 3 Bool, 3 [String], 2 [Int]
        let expectation = XCTestExpectation(description: "test_merge_7_b")

        Asyncify.merge(AsyncMockData.merge_3_int, AsyncMockData.merge_4_str, AsyncMockData.merge_3_bool, AsyncMockData.merge_4_strArr, AsyncMockData.merge_2_intArr, completion: { value, error in

            XCTAssertTrue(error[0].isEmpty, "0 errors produced at [0].")
            XCTAssertTrue(error[1].isEmpty, "0 errors produced at [1].")
            XCTAssertTrue(error[2].isEmpty, "0 errors produced at [2].")

            XCTAssertNil(error[3][0], "0 errors produced at position [3][0].")
            XCTAssertNil(error[3][1], "0 errors produced at position [3][1].")
            XCTAssertNil(error[3][2], "0 errors produced at position [3][2].")
            XCTAssertNotNil(error[3][3], "1 errors produced at position [3][3].")

            XCTAssertTrue(error[4].isEmpty, "0 errors produced.")

            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }
}
