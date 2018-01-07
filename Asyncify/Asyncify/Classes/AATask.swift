//
//  AATask.swift
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation

public struct Asyncify {}

/// - description: Task wrapper for an asynchronous task.
///
/// - parameters:
///   - success: Success block which captures a value from your asynchronous task.
///   - failure: Failure block which captures an optional error from your asynchronous task.
///
/// - URLSessionDataTask: Task object returned from your asynchronous task - these are collected and returned
///   to the caller.

typealias AATask<T> = (_ success: @escaping (T) -> Void,
    _ failure: @escaping (Error?) -> Void) -> URLSessionDataTask

/// - description: Task wrapper for an asynchronous task.
///
/// - parameters:
///   - success: Success block which captures a value from your asynchronous task.
///   - failure: Failure block which captures an optional error from your asynchronous task.
///

typealias AATaskVoid<ValueType> = (_ success: @escaping (ValueType) -> Void,
    _ failure: @escaping (Error?) -> Void) -> Void
