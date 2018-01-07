//
//  AA+Combine.swift
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation

extension AsyncAlly {

    /// - description: Executes an array of tasks of one type and a single task of an another type and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AATasks associated with the same data type.
    ///   - b: Asynchronous AATask.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.

    ///
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.

    @discardableResult static func combine<A, B>(_ a: [AATask<A>],
                                                 _ b: AATask<B>,
                                                 observeOn: DispatchQueue = DispatchQueue.main,
                                                 completion: @escaping (([A?], B?), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: ([A?], B?) = ([], nil)

        dispatchGroup.enter()
        sessionDataTasks += zip(a, completion: { zipResults, zipErrors in
            results.0 = zipResults
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks.append(b({ value in
            results.1 = value
            dispatchGroup.leave()
        }, { error in
            if let error = error { errors.append(error) }
            dispatchGroup.leave()
        }))

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }

    /// - description: Executes two arrays of tasks and a single task and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AATasks associated with the same data type.
    ///   - b: Array of AATasks associated with the same data type.
    ///   - c: Asynchronous AATask.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.

    ///
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.

    @discardableResult static func combine<A, B, C>(_ a: [AATask<A>],
                                                    _ b: [AATask<B>],
                                                    _ c: AATask<C>,
                                                    observeOn: DispatchQueue = DispatchQueue.main,
                                                    completion: @escaping (([A?], [B?], C?), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: ([A?], [B?], C?) = ([], [], nil)

        dispatchGroup.enter()
        sessionDataTasks += zip(a, b, completion: { zipResults, zipErrors in
            results.0 = zipResults.0
            results.1 = zipResults.1
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks.append(c({ value in
            results.2 = value
            dispatchGroup.leave()
        }, { error in
            if let error = error { errors.append(error) }
            dispatchGroup.leave()
        }))

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }

    /// - description: Executes an array of tasks and two single tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AATasks associated with the same data type.
    ///   - b: Asynchronous AATask.
    ///   - c: Asynchronous AATask.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.

    ///
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.

    @discardableResult static func combine<A, B, C>(_ a: [AATask<A>],
                                                    _ b: AATask<B>,
                                                    _ c: AATask<C>,
                                                    observeOn: DispatchQueue = DispatchQueue.main,
                                                    completion: @escaping (([A?], B?, C?), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: ([A?], B?, C?) = ([], nil, nil)

        dispatchGroup.enter()
        sessionDataTasks += zip(a, completion: { zipResults, zipErrors in
            results.0 = zipResults
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks += merge(b, c, completion: { mergeResults, mergeErrors in
            results.1 = mergeResults.0
            results.2 = mergeResults.1
            errors += mergeErrors
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }

    /// - description: Executes two arrays of tasks and two single tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AATasks associated with the same data type.
    ///   - b: Array of AATasks associated with the same data type.
    ///   - c: Asynchronous AATask.
    ///   - d: Asynchronous AATask.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.

    ///
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.

    @discardableResult static func combine<A, B, C, D>(_ a: [AATask<A>],
                                                       _ b: [AATask<B>],
                                                       _ c: AATask<C>,
                                                       _ d: AATask<D>,
                                                       observeOn: DispatchQueue = DispatchQueue.main,
                                                       completion: @escaping (([A?], [B?], C?, D?), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: ([A?], [B?], C?, D?) = ([], [], nil, nil)

        dispatchGroup.enter()
        sessionDataTasks += zip(a, b, completion: { zipResults, zipErrors in
            results.0 = zipResults.0
            results.1 = zipResults.1
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks += merge(c, d, completion: { mergeResults, mergeErrors in
            results.2 = mergeResults.0
            results.3 = mergeResults.1
            errors += mergeErrors
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }
}
