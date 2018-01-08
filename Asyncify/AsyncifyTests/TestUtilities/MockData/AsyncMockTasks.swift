//
//  AsyncMockTasks.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import Asyncify

struct AsyncMockTasks {

    //mock tasks with String value types
    static let mockSuccess1 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess1(success: success, failure: failure)
    })

    static let mockSuccess2 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess2(success: success, failure: failure)
    })

    static let mockSuccess3 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess3(success: success, failure: failure)
    })

    static let mockSuccess4 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess4(success: success, failure: failure)
    })

    static let mockSuccess5 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess5(success: success, failure: failure)
    })

    static let mockFailure1 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockFailure1(success: success, failure: failure)
    })

    //mock tasks with Int value types
    static let mockSuccess6 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess6(success: success, failure: failure)
    })

    static let mockSuccess7 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess7(success: success, failure: failure)
    })

    static let mockSuccess8 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess8(success: success, failure: failure)
    })

    static let mockFailure2 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockFailure2(success: success, failure: failure)
    })

    //mock tasks with Bool value types
    static let mockSuccess9 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess9(success: success, failure: failure)
    })

    static let mockSuccess10 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess10(success: success, failure: failure)
    })

    static let mockSuccess11 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess11(success: success, failure: failure)
    })

    static let mockFailure3 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockFailure3(success: success, failure: failure)
    })

    //mock tasks with [String] value types
    static let mockSuccess12 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess12(success: success, failure: failure)
    })

    static let mockSuccess13 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess13(success: success, failure: failure)
    })

    static let mockSuccess14 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess14(success: success, failure: failure)
    })

    static let mockFailure4 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockFailure4(success: success, failure: failure)
    })

    //mock tasks with [Int] value types
    static let mockSuccess15 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess15(success: success, failure: failure)
    })

    static let mockSuccess16 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockSuccess16(success: success, failure: failure)
    })

    static let mockFailure5 = generateAsyncTask(from: { (success, failure) -> URLSessionDataTask in
        AsyncMockFunctions.mockFailure5(success: success, failure: failure)
    })

    //mock void tasks with String value types
    static let mockVoidSuccess1 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess1(success: success, failure: failure)
    })

    static let mockVoidSuccess2 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess2(success: success, failure: failure)
    })

    static let mockVoidSuccess3 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess3(success: success, failure: failure)
    })

    static let mockVoidSuccess4 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess4(success: success, failure: failure)
    })

    static let mockVoidSuccess5 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess5(success: success, failure: failure)
    })

    static let mockVoidFailure1 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidFailure1(success: success, failure: failure)
    })

    //mock void tasks with Int value types
    static let mockVoidSuccess6 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess6(success: success, failure: failure)
    })

    static let mockVoidSuccess7 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess7(success: success, failure: failure)
    })

    static let mockVoidSuccess8 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess8(success: success, failure: failure)
    })

    static let mockVoidFailure2 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidFailure2(success: success, failure: failure)
    })

    //mock void tasks with Bool value types
    static let mockVoidSuccess9 = generateAsyncVoidTask(from: { (success, failure)  in
        AsyncMockFunctions.mockVoidSuccess9(success: success, failure: failure)
    })

    static let mockVoidSuccess10 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess10(success: success, failure: failure)
    })

    static let mockVoidSuccess11 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess11(success: success, failure: failure)
    })

    static let mockVoidFailure3 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidFailure3(success: success, failure: failure)
    })

    //mock void tasks with [String] value types
    static let mockVoidSuccess12 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess12(success: success, failure: failure)
    })

    static let mockVoidSuccess13 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess13(success: success, failure: failure)
    })

    static let mockVoidSuccess14 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess14(success: success, failure: failure)
    })

    static let mockVoidFailure4 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidFailure4(success: success, failure: failure)
    })

    //mock void tasks with [Int] value types
    static let mockVoidSuccess15 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess15(success: success, failure: failure)
    })

    static let mockVoidSuccess16 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidSuccess16(success: success, failure: failure)
    })

    static let mockVoidFailure5 = generateAsyncVoidTask(from: { (success, failure) in
        AsyncMockFunctions.mockVoidFailure5(success: success, failure: failure)
    })
}
