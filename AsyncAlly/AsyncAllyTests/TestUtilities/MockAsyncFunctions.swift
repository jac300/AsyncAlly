//
//  MockAsyncFunctions.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation

struct MockAsyncFunctions {

    static let queue = DispatchQueue(label: "AsyncAlly_test_queue", qos: .background)
    typealias FunctionType<T> = (@escaping (T) -> Void, @escaping (Error?) -> Void) -> URLSessionDataTask

    enum MockAsyncError: Error {
        case serverUnavailable
    }

    static func mockSuccess1(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(2), execute: {
            success("1")
        })

        return URLSessionDataTask()
    }

    static func mockSuccess2(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(3), execute: {
            success("2")
        })

        return URLSessionDataTask()
    }

    static func mockSuccess3(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(5), execute: {
            success("3")
        })

        return URLSessionDataTask()
    }

    static func mockFailure1(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(1), execute: {
            failure(nil)
        })

        return URLSessionDataTask()
    }

    static func mockFailure2(success: @escaping (String) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(1), execute: {
            failure(MockAsyncError.serverUnavailable)
        })

        return URLSessionDataTask()
    }

    static func mockSuccess4(success: @escaping (Int) -> Void,
                             failure: @escaping (Error?) -> Void) -> URLSessionDataTask {
        queue.asyncAfter(deadline: .now() + .seconds(4), execute: {
            success(4)
        })

        return URLSessionDataTask()
    }
}
