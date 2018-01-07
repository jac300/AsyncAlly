//
//  AAZipTests.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/5/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import XCTest
@testable import AsyncAlly

class AAZipTests: XCTestCase {

    func test_zip_1() {

        //Zip 3 String
        let expectation = XCTestExpectation(description: "test_zip_1")

        AsyncAlly.zip(AAMockZips.zip_3_str, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")
            XCTAssertTrue(value.count == 3, "3 String values were produced.")

            XCTAssertTrue(value[0] == "1", "String with value 1 was stored in the 0 position.")
            XCTAssertTrue(value[1] == "2", "String with value 2 was stored in the 1 position.")
            XCTAssertTrue(value[2] == "3", "String with value 3 was stored in the 2 position.")
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 100.0)
    }

    func test_zip_2() {

        //Zip 5 String
        let expectation = XCTestExpectation(description: "test_zip_2")

        AsyncAlly.zip(AAMockZips.zip_5_str, completion: { value, error in

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

    func test_zip_3() {

        //Zip 3 Int, 2 String
        let expectation = XCTestExpectation(description: "test_zip_3")

        AsyncAlly.zip(AAMockZips.zip_3_int, AAMockZips.zip_2_str, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")
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

    func test_zip_4() {

        //Zip 3 Int, 2 String, 3 Bool
        let expectation = XCTestExpectation(description: "test_zip_4")

        AsyncAlly.zip(AAMockZips.zip_3_int, AAMockZips.zip_2_str, AAMockZips.zip_3_bool, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")
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

    func test_zip_5() {

        //Zip 3 Int, 2 String, 3 Bool, 3 [String]
        let expectation = XCTestExpectation(description: "test_zip_5")

        AsyncAlly.zip(AAMockZips.zip_3_int, AAMockZips.zip_2_str, AAMockZips.zip_3_bool, AAMockZips.zip_3_strArr, completion: { value, error in

            XCTAssertTrue(error.isEmpty, "0 errors produced.")
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

    func test_zip_6() {

        //Zip 3 Int, 2 String, 3 Bool, 3 [String], 2 [Int]
        let expectation = XCTestExpectation(description: "test_zip_6")

        AsyncAlly.zip(AAMockZips.zip_3_int, AAMockZips.zip_2_str, AAMockZips.zip_3_bool, AAMockZips.zip_3_strArr, AAMockZips.zip_2_intArr,
                      completion: { value, error in

                        XCTAssertTrue(error.isEmpty, "0 errors produced.")
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

    func test_zip_7() {

        //Zip 3 Int, 2 String, 3 Bool, 3 [String], 2 [Int] with failures
        let expectation = XCTestExpectation(description: "test_zip_7")

        AsyncAlly.zip(AAMockZips.zip_3_int, AAMockZips.zip_4_str, AAMockZips.zip_3_bool, AAMockZips.zip_4_strArr,
                      AAMockZips.zip_2_intArr, completion: { value, error in

                        XCTAssertTrue(error.count == 1, "1 error produced.")
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
}
