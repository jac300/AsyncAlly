//
//  AAMockAATasks.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import AsyncAlly

struct AAMockTaskObjects {

    //mock task objects with String value types
    static let mockSuccess1 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess1(success: success, failure: failure)
    })

    static let mockSuccess2 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess2(success: success, failure: failure)
    })

    static let mockSuccess3 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess3(success: success, failure: failure)
    })

    static let mockSuccess4 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess4(success: success, failure: failure)
    })

    static let mockSuccess5 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess5(success: success, failure: failure)
    })

    static let mockFailure1 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure1(success: success, failure: failure)
    })

    //mock task objects with Int value types
    static let mockSuccess6 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess6(success: success, failure: failure)
    })

    static let mockSuccess7 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess7(success: success, failure: failure)
    })

    static let mockSuccess8 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess8(success: success, failure: failure)
    })

    static let mockFailure2 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure2(success: success, failure: failure)
    })

    //mock task objects with Bool value types
    static let mockSuccess9 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess9(success: success, failure: failure)
    })

    static let mockSuccess10 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess10(success: success, failure: failure)
    })

    static let mockSuccess11 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess11(success: success, failure: failure)
    })

    static let mockFailure3 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure3(success: success, failure: failure)
    })

    //mock task objects with [String] value types
    static let mockSuccess12 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess12(success: success, failure: failure)
    })

    static let mockSuccess13 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess13(success: success, failure: failure)
    })

    static let mockSuccess14 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess14(success: success, failure: failure)
    })

    static let mockFailure4 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure4(success: success, failure: failure)
    })

    //mock task objects with [Int] value types
    static let mockSuccess15 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess15(success: success, failure: failure)
    })

    static let mockSuccess16 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess16(success: success, failure: failure)
    })

    static let mockFailure5 = generateTaskObject(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure5(success: success, failure: failure)
    })
}
