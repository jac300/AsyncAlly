//
//  AAMockTasks.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import Asyncify

struct AAMockTasks {

    //mock tasks with String value types
    static let mockSuccess1 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess1(success: success, failure: failure)
    })

    static let mockSuccess2 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess2(success: success, failure: failure)
    })

    static let mockSuccess3 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess3(success: success, failure: failure)
    })

    static let mockSuccess4 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess4(success: success, failure: failure)
    })

    static let mockSuccess5 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess5(success: success, failure: failure)
    })

    static let mockFailure1 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure1(success: success, failure: failure)
    })

    //mock tasks with Int value types
    static let mockSuccess6 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess6(success: success, failure: failure)
    })

    static let mockSuccess7 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess7(success: success, failure: failure)
    })

    static let mockSuccess8 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess8(success: success, failure: failure)
    })

    static let mockFailure2 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure2(success: success, failure: failure)
    })

    //mock tasks with Bool value types
    static let mockSuccess9 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess9(success: success, failure: failure)
    })

    static let mockSuccess10 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess10(success: success, failure: failure)
    })

    static let mockSuccess11 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess11(success: success, failure: failure)
    })

    static let mockFailure3 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure3(success: success, failure: failure)
    })

    //mock tasks with [String] value types
    static let mockSuccess12 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess12(success: success, failure: failure)
    })

    static let mockSuccess13 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess13(success: success, failure: failure)
    })

    static let mockSuccess14 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess14(success: success, failure: failure)
    })

    static let mockFailure4 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure4(success: success, failure: failure)
    })

    //mock tasks with [Int] value types
    static let mockSuccess15 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess15(success: success, failure: failure)
    })

    static let mockSuccess16 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockSuccess16(success: success, failure: failure)
    })

    static let mockFailure5 = generateAATask(from: { (success, failure) -> URLSessionDataTask in
        MockAsyncFunctions.mockFailure5(success: success, failure: failure)
    })

    //mock void tasks with String value types
    static let mockVoidSuccess1 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess1(success: success, failure: failure)
    })

    static let mockVoidSuccess2 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess2(success: success, failure: failure)
    })

    static let mockVoidSuccess3 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess3(success: success, failure: failure)
    })

    static let mockVoidSuccess4 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess4(success: success, failure: failure)
    })

    static let mockVoidSuccess5 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess5(success: success, failure: failure)
    })

    static let mockVoidFailure1 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidFailure1(success: success, failure: failure)
    })

    //mock void tasks with Int value types
    static let mockVoidSuccess6 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess6(success: success, failure: failure)
    })

    static let mockVoidSuccess7 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess7(success: success, failure: failure)
    })

    static let mockVoidSuccess8 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess8(success: success, failure: failure)
    })

    static let mockVoidFailure2 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidFailure2(success: success, failure: failure)
    })

    //mock void tasks with Bool value types
    static let mockVoidSuccess9 = generateAAVoidTask(from: { (success, failure)  in
        MockAsyncFunctions.mockVoidSuccess9(success: success, failure: failure)
    })

    static let mockVoidSuccess10 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess10(success: success, failure: failure)
    })

    static let mockVoidSuccess11 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess11(success: success, failure: failure)
    })

    static let mockVoidFailure3 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidFailure3(success: success, failure: failure)
    })

    //mock void tasks with [String] value types
    static let mockVoidSuccess12 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess12(success: success, failure: failure)
    })

    static let mockVoidSuccess13 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess13(success: success, failure: failure)
    })

    static let mockVoidSuccess14 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess14(success: success, failure: failure)
    })

    static let mockVoidFailure4 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidFailure4(success: success, failure: failure)
    })

    //mock void tasks with [Int] value types
    static let mockVoidSuccess15 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess15(success: success, failure: failure)
    })

    static let mockVoidSuccess16 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidSuccess16(success: success, failure: failure)
    })

    static let mockVoidFailure5 = generateAAVoidTask(from: { (success, failure) in
        MockAsyncFunctions.mockVoidFailure5(success: success, failure: failure)
    })
}
