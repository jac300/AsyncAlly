import Foundation

public struct AsyncAlly {}

/// - description: Task wrapper for asynchronous tasks.
///
/// - parameters:
///   - success: Success block which captures a value from your asynchronous task.
///   - success: Failure block which captures an optional error from your asynchronous task.
///
/// - URLSessionDataTask: Task object returned from your asynchronous task - these are collected and returned
///   to the caller for optional cancellation.

typealias AATask<T> = (_ success: @escaping (T) -> Void,
    _ failure: @escaping (Error?) -> Void) -> URLSessionDataTask


//typealias AATaskVoid<ValueType> = (_ success: @escaping (ValueType) -> Void,
//    _ failure: @escaping (Error?) -> Void) -> Void
