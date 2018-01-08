//
//  AsyncMockFunctions.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import Asyncify

struct AsyncMockFunctions {

    private static let queue = DispatchQueue(label: "Asyncify_test_queue", qos: .background)
    typealias FunctionType<T> = (@escaping (T) -> Void, @escaping (Error?) -> Void) -> URLSessionDataTask
    typealias FunctionTypeVoid<T> = (@escaping (T) -> Void, @escaping (Error?) -> Void) -> Void

    private enum MockAsyncError: Error {
        case serverUnavailable
    }

    private static var randomElapsedTime: Int {
        return Int(arc4random_uniform(2)+1)
    }

    //mock async function with String value types
    static func mockSuccess1(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("1")
        })

        return URLSessionDataTask()
    }

    static func mockSuccess2(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("2")
        })

        return URLSessionDataTask()
    }

    static func mockSuccess3(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("3")
        })

        return URLSessionDataTask()
    }

    static func mockSuccess4(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("4")
        })

        return URLSessionDataTask()
    }

    static func mockSuccess5(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("5")
        })

        return URLSessionDataTask()
    }

    static func mockFailure1(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(nil)
        })

        return URLSessionDataTask()
    }

    //mock async function with Int value types
    static func mockSuccess6(success: @escaping (Int) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(6)
        })

        return URLSessionDataTask()
    }

    static func mockSuccess7(success: @escaping (Int) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(7)
        })

        return URLSessionDataTask()
    }

    static func mockSuccess8(success: @escaping (Int) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(8)
        })

        return URLSessionDataTask()
    }

    static func mockFailure2(success: @escaping (Int) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(nil)
        })

        return URLSessionDataTask()
    }

    //mock async function with Bool value types
    static func mockSuccess9(success: @escaping (Bool) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(true)
        })

        return URLSessionDataTask()
    }

    static func mockSuccess10(success: @escaping (Bool) -> Void,
                              failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(false)
        })

        return URLSessionDataTask()
    }

    static func mockSuccess11(success: @escaping (Bool) -> Void,
                              failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(true)
        })

        return URLSessionDataTask()
    }

    static func mockFailure3(success: @escaping (Bool) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(nil)
        })

        return URLSessionDataTask()
    }

    //mock async function with [String] value types
    static func mockSuccess12(success: @escaping ([String]) -> Void,
                              failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(["12"])
        })

        return URLSessionDataTask()
    }

    static func mockSuccess13(success: @escaping ([String]) -> Void,
                              failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(["13"])
        })

        return URLSessionDataTask()
    }

    static func mockSuccess14(success: @escaping ([String]) -> Void,
                              failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(["14"])
        })

        return URLSessionDataTask()
    }

    static func mockFailure4(success: @escaping ([String]) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(MockAsyncError.serverUnavailable)
        })

        return URLSessionDataTask()
    }

    //mock async function with [Int] value types
    static func mockSuccess15(success: @escaping ([Int]) -> Void,
                              failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success([15])
        })

        return URLSessionDataTask()
    }

    static func mockSuccess16(success: @escaping ([Int]) -> Void,
                              failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success([16])
        })

        return URLSessionDataTask()
    }

    static func mockFailure5(success: @escaping ([Int]) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(MockAsyncError.serverUnavailable)
        })

        return URLSessionDataTask()
    }

    //mock async void function with String value types
    static func mockVoidSuccess1(success: @escaping (String) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("1")
        })
    }

    static func mockVoidSuccess2(success: @escaping (String) -> Void,
                                  failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("2")
        })
    }

    static func mockVoidSuccess3(success: @escaping (String) -> Void,
                                  failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("3")
        })
    }

    static func mockVoidSuccess4(success: @escaping (String) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("4")
        })
    }

    static func mockVoidSuccess5(success: @escaping (String) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success("5")
        })
    }

    static func mockVoidFailure1(success: @escaping (String) -> Void,
                                  failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(nil)
        })
    }

    //mock async void function with Int value types
    static func mockVoidSuccess6(success: @escaping (Int) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(6)
        })
    }

    static func mockVoidSuccess7(success: @escaping (Int) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(7)
        })
    }

    static func mockVoidSuccess8(success: @escaping (Int) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(8)
        })
    }

    static func mockVoidFailure2(success: @escaping (Int) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(nil)
        })
    }

    //mock async void function with Bool value types
    static func mockVoidSuccess9(success: @escaping (Bool) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(true)
        })
    }

    static func mockVoidSuccess10(success: @escaping (Bool) -> Void,
                              failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(false)
        })
    }

    static func mockVoidSuccess11(success: @escaping (Bool) -> Void,
                                  failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(true)
        })
    }

    static func mockVoidFailure3(success: @escaping (Bool) -> Void,
                             failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(nil)
        })
    }

    //mock async void function with [String] value types
    static func mockVoidSuccess12(success: @escaping ([String]) -> Void,
                                  failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(["12"])
        })
    }

    static func mockVoidSuccess13(success: @escaping ([String]) -> Void,
                                  failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(["13"])
        })
    }

    static func mockVoidSuccess14(success: @escaping ([String]) -> Void,
                                  failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success(["14"])
        })
    }

    static func mockVoidFailure4(success: @escaping ([String]) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(MockAsyncError.serverUnavailable)
        })
    }

    //mock async void function with [Int] value types
    static func mockVoidSuccess15(success: @escaping ([Int]) -> Void,
                                  failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success([15])
        })
    }

    static func mockVoidSuccess16(success: @escaping ([Int]) -> Void,
                                  failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            success([16])
        })
    }

    static func mockVoidFailure5(success: @escaping ([Int]) -> Void,
                                 failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(randomElapsedTime), execute: {
            failure(MockAsyncError.serverUnavailable)
        })
    }
}
