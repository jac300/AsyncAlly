//
//  Asyncify+MergeVariedType.swift
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation

extension Asyncify { //AsyncTask functions

    /// - description: Executes an array of tasks of one type and a single task of an another type and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AsyncTasks associated with the same data type.
    ///   - b: Asynchronous AsyncTask.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - success: Completion block which is executed when all tasks have completed, ONLY if all included tasks are successful.
    ///   - failure: Completion block which is executed when all tasks have completed, ONLY if at least one included task failed.
    ///   - completion: Completion block which is executed when all tasks have completed, includes succesful response values and errors.
    ///   NOTE (applicable for success/failure/completion):
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding tuple index will be nil, or, if the value is an array, the value at the corresponding array index will be nil.
    ///     3) If a single request failed, the value at corresponding index in the corresponding errors array will be an optional error; other indices will have nil values. If the error is represented singly in a tuple, that tuple index will have an optional error.
    ///     4) If no requests failed, an errors array will be empty.
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.

    @discardableResult public static func merge<A, B>(_ a: [AsyncTask<A>],
                                                      _ b: AsyncTask<B>,
                                                      observeOn: DispatchQueue = DispatchQueue.main,
                                                      success: ((([A], B)) -> Void)? = nil,
                                                      failure: ((([Error?], Error?)) -> Void)? = nil,
                                                      completion: ((([A?], B?), ([Error?], Error?)) -> Void)? = nil) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors: ([Error?], Error?) = ([Error?](repeating: nil, count: a.count), nil)
        var results: ([A?], B?) = ([], nil)

        dispatchGroup.enter()
        sessionDataTasks += merge(a, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults
            errors.0 = mergeErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks.append(b({ value in
            results.1 = value
            dispatchGroup.leave()
        }, { error in
            errors.1 = error
            dispatchGroup.leave()
        }))

        dispatchGroup.notify(queue: observeOn) {
            errors.0 = errors.0.process()
            if Array(results.0.flatMap{ $0 }).count == a.count, let b = results.1 {
                success?((results.0.flatMap{ $0 }, b))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }

    /// - description: Executes two arrays of tasks and a single task and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AsyncTasks associated with the same data type.
    ///   - b: Array of AsyncTasks associated with the same data type.
    ///   - c: Asynchronous AsyncTask.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - success: Completion block which is executed when all tasks have completed, ONLY if all included tasks are successful.
    ///   - failure: Completion block which is executed when all tasks have completed, ONLY if at least one included task failed.
    ///   - completion: Completion block which is executed when all tasks have completed, includes succesful response values and errors.
    ///   NOTE (applicable for success/failure/completion):
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding tuple index will be nil, or, if the value is an array, the value at the corresponding array index will be nil.
    ///     3) If a single request failed, the value at corresponding index in the corresponding errors array will be an optional error; other indices will have nil values. If the error is represented singly in a tuple, that tuple index will have an optional error.
    ///     4) If no requests failed, an errors array will be empty.
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.

    @discardableResult public static func merge<A, B, C>(_ a: [AsyncTask<A>],
                                                         _ b: [AsyncTask<B>],
                                                         _ c: AsyncTask<C>,
                                                         observeOn: DispatchQueue = DispatchQueue.main,
                                                         success: ((([A], [B], C)) -> Void)? = nil,
                                                         failure: ((([Error?], [Error?], Error?)) -> Void)? = nil,
                                                         completion: ((([A?], [B?], C?), ([Error?], [Error?], Error?)) -> Void)? = nil) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors: ([Error?], [Error?], Error?) = ([Error?](repeating: nil, count: a.count), [Error?](repeating: nil, count: b.count), nil)
        var results: ([A?], [B?], C?) = ([], [], nil)

        dispatchGroup.enter()
        sessionDataTasks += merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors.0 = mergeErrors[0]
            errors.1 = mergeErrors[1]
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks.append(c({ value in
            results.2 = value
            dispatchGroup.leave()
        }, { error in
            errors.2 = error
            dispatchGroup.leave()
        }))

        dispatchGroup.notify(queue: observeOn) {
            errors.0 = errors.0.process()
            errors.1 = errors.1.process()
            if Array(results.0.flatMap{ $0 }).count == a.count, Array(results.1.flatMap{ $0 }).count == b.count, let c = results.2 {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, c))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }

    /// - description: Executes an array of tasks and two single tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AsyncTasks associated with the same data type.
    ///   - b: Asynchronous AsyncTask.
    ///   - c: Asynchronous AsyncTask.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - success: Completion block which is executed when all tasks have completed, ONLY if all included tasks are successful.
    ///   - failure: Completion block which is executed when all tasks have completed, ONLY if at least one included task failed.
    ///   - completion: Completion block which is executed when all tasks have completed, includes succesful response values and errors.
    ///   NOTE (applicable for success/failure/completion):
    ///     2) If a single request failed, the value at corresponding tuple index will be nil, or, if the value is an array, the value at the corresponding array index will be nil.
    ///     3) If a single request failed, the value at corresponding index in the corresponding errors array will be an optional error; other indices will have nil values. If the error is represented singly in a tuple, that tuple index will have an optional error.
    ///     4) If no requests failed, an errors array will be empty.
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.

    @discardableResult public static func merge<A, B, C>(_ a: [AsyncTask<A>],
                                                         _ b: AsyncTask<B>,
                                                         _ c: AsyncTask<C>,
                                                         observeOn: DispatchQueue = DispatchQueue.main,
                                                         success: ((([A], B, C)) -> Void)? = nil,
                                                         failure: ((([Error?], Error?, Error?)) -> Void)? = nil,
                                                         completion: ((([A?], B?, C?), ([Error?], Error?, Error?)) -> Void)? = nil) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors: ([Error?], Error?, Error?) = ([Error?](repeating: nil, count: a.count), nil, nil)
        var results: ([A?], B?, C?) = ([], nil, nil)

        dispatchGroup.enter()
        sessionDataTasks += merge(a, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults
            errors.0 = mergeErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks += merge(b, c, completion: { mergeResults, mergeErrors in
            results.1 = mergeResults.0
            results.2 = mergeResults.1
            errors.1 = mergeErrors.isEmpty ? nil : mergeErrors[0]
            errors.2 = mergeErrors.isEmpty ? nil : mergeErrors[1]
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) {
            errors.0 = errors.0.process()
            if Array(results.0.flatMap{ $0 }).count == a.count, let b = results.1, let c = results.2 {
                success?((results.0.flatMap{ $0 }, b, c))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }

    /// - description: Executes two arrays of tasks and two single tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AsyncTasks associated with the same data type.
    ///   - b: Array of AsyncTasks associated with the same data type.
    ///   - c: Asynchronous AsyncTask.
    ///   - d: Asynchronous AsyncTask.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - success: Completion block which is executed when all tasks have completed, ONLY if all included tasks are successful.
    ///   - failure: Completion block which is executed when all tasks have completed, ONLY if at least one included task failed.
    ///   - completion: Completion block which is executed when all tasks have completed, includes succesful response values and errors.
    ///   NOTE (applicable for success/failure/completion):
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding tuple index will be nil, or, if the value is an array, the value at the corresponding array index will be nil.
    ///     3) If a single request failed, the value at corresponding index in the corresponding errors array will be an optional error; other indices will have nil values. If the error is represented singly in a tuple, that tuple index will have an optional error.
    ///     4) If no requests failed, an errors array will be empty.
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.

    @discardableResult public static func merge<A, B, C, D>(_ a: [AsyncTask<A>],
                                                            _ b: [AsyncTask<B>],
                                                            _ c: AsyncTask<C>,
                                                            _ d: AsyncTask<D>,
                                                            observeOn: DispatchQueue = DispatchQueue.main,
                                                            success: ((([A], [B], C, D)) -> Void)? = nil,
                                                            failure: ((([Error?], [Error?], Error?, Error?)) -> Void)? = nil,
                                                            completion: ((([A?], [B?], C?, D?), ([Error?], [Error?], Error?, Error?)) -> Void)? = nil) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors: ([Error?], [Error?], Error?, Error?) = ([Error?](repeating: nil, count: a.count),
                                                            [Error?](repeating: nil, count: b.count), nil, nil)
        var results: ([A?], [B?], C?, D?) = ([], [], nil, nil)

        dispatchGroup.enter()
        sessionDataTasks += merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors.0 = mergeErrors[0]
            errors.1 = mergeErrors[1]
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks += merge(c, d, completion: { mergeResults, mergeErrors in
            results.2 = mergeResults.0
            results.3 = mergeResults.1
            errors.2 = mergeErrors.isEmpty ? nil : mergeErrors[0]
            errors.3 = mergeErrors.isEmpty ? nil : mergeErrors[1]
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) {
            errors.0 = errors.0.process()
            errors.1 = errors.1.process()
            if Array(results.0.flatMap{ $0 }).count == a.count, Array(results.1.flatMap{ $0 }).count == b.count, let c = results.2, let d = results.3 {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, c, d))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
}

extension Asyncify { //AsyncTaskVoid functions

    /// - description: Executes an array of tasks of one type and a single task of an another type and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AsyncTaskVoids associated with the same data type.
    ///   - b: Asynchronous AsyncTaskVoid.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - success: Completion block which is executed when all tasks have completed, ONLY if all included tasks are successful.
    ///   - failure: Completion block which is executed when all tasks have completed, ONLY if at least one included task failed.
    ///   - completion: Completion block which is executed when all tasks have completed, includes succesful response values and errors.
    ///   NOTE (applicable for success/failure/completion):
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding tuple index will be nil, or, if the value is an array, the value at the corresponding array index will be nil.
    ///     3) If a single request failed, the value at corresponding index in the corresponding errors array will be an optional error; other indices will have nil values. If the error is represented singly in a tuple, that tuple index will have an optional error.
    ///     4) If no requests failed, an errors array will be empty.


    public static func merge<A, B>(_ a: [AsyncTaskVoid<A>],
                                   _ b: AsyncTaskVoid<B>,
                                   observeOn: DispatchQueue = DispatchQueue.main,
                                   success: ((([A], B)) -> Void)? = nil,
                                   failure: ((([Error?], Error?)) -> Void)? = nil,
                                   completion: ((([A?], B?), ([Error?], Error?)) -> Void)? = nil) {

        let dispatchGroup = DispatchGroup()
        var errors: ([Error?], Error?) = ([Error?](repeating: nil, count: a.count), nil)
        var results: ([A?], B?) = ([], nil)

        dispatchGroup.enter()
        merge(a, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults
            errors.0 = mergeErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        b({ value in
            results.1 = value
            dispatchGroup.leave()
        }, { error in
            errors.1 = error
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) {
            errors.0 = errors.0.process()
            if Array(results.0.flatMap{ $0 }).count == a.count, let b = results.1 {
                success?((results.0.flatMap{ $0 }, b))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }

    /// - description: Executes two arrays of tasks and a single task and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AsyncTaskVoids associated with the same data type.
    ///   - b: Array of AsyncTaskVoids associated with the same data type.
    ///   - c: Asynchronous AsyncTaskVoid.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - success: Completion block which is executed when all tasks have completed, ONLY if all included tasks are successful.
    ///   - failure: Completion block which is executed when all tasks have completed, ONLY if at least one included task failed.
    ///   - completion: Completion block which is executed when all tasks have completed, includes succesful response values and errors.
    ///   NOTE (applicable for success/failure/completion):
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding tuple index will be nil, or, if the value is an array, the value at the corresponding array index will be nil.
    ///     3) If a single request failed, the value at corresponding index in the corresponding errors array will be an optional error; other indices will have nil values. If the error is represented singly in a tuple, that tuple index will have an optional error.
    ///     4) If no requests failed, an errors array will be empty.

    public static func merge<A, B, C>(_ a: [AsyncTaskVoid<A>],
                                      _ b: [AsyncTaskVoid<B>],
                                      _ c: AsyncTaskVoid<C>,
                                      observeOn: DispatchQueue = DispatchQueue.main,
                                      success: ((([A], [B], C)) -> Void)? = nil,
                                      failure: ((([Error?], [Error?], Error?)) -> Void)? = nil,
                                      completion: ((([A?], [B?], C?), ([Error?], [Error?], Error?)) -> Void)? = nil) {

        let dispatchGroup = DispatchGroup()
        var errors: ([Error?], [Error?], Error?) = ([Error?](repeating: nil, count: a.count),
                                             [Error?](repeating: nil, count: b.count), nil)
        var results: ([A?], [B?], C?) = ([], [], nil)

        dispatchGroup.enter()
        merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors.0 = mergeErrors[0]
            errors.1 = mergeErrors[1]
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        c({ value in
            results.2 = value
            dispatchGroup.leave()
        }, { error in
            errors.2 = error
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) {
            errors.0 = errors.0.process()
            errors.1 = errors.1.process()
            if Array(results.0.flatMap{ $0 }).count == a.count, Array(results.1.flatMap{ $0 }).count == b.count, let c = results.2 {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, c))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }

    /// - description: Executes an array of tasks and two single tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AsyncTaskVoids associated with the same data type.
    ///   - b: Asynchronous AsyncTaskVoid.
    ///   - c: Asynchronous AsyncTaskVoid.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - success: Completion block which is executed when all tasks have completed, ONLY if all included tasks are successful.
    ///   - failure: Completion block which is executed when all tasks have completed, ONLY if at least one included task failed.
    ///   - completion: Completion block which is executed when all tasks have completed, includes succesful response values and errors.
    ///   NOTE (applicable for success/failure/completion):
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding tuple index will be nil, or, if the value is an array, the value at the corresponding array index will be nil.
    ///     3) If a single request failed, the value at corresponding index in the corresponding errors array will be an optional error; other indices will have nil values. If the error is represented singly in a tuple, that tuple index will have an optional error.
    ///     4) If no requests failed, an errors array will be empty.

    public static func merge<A, B, C>(_ a: [AsyncTaskVoid<A>],
                                      _ b: AsyncTaskVoid<B>,
                                      _ c: AsyncTaskVoid<C>,
                                      observeOn: DispatchQueue = DispatchQueue.main,
                                      success: ((([A], B, C)) -> Void)? = nil,
                                      failure: ((([Error?], Error?, Error?)) -> Void)? = nil,
                                      completion: ((([A?], B?, C?), ([Error?], Error?, Error?)) -> Void)? = nil) {

        let dispatchGroup = DispatchGroup()
        var errors: ([Error?], Error?, Error?) = ([Error?](repeating: nil, count: a.count), nil, nil)
        var results: ([A?], B?, C?) = ([], nil, nil)

        dispatchGroup.enter()
        merge(a, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults
            errors.0 = mergeErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        merge(b, c, completion: { mergeResults, mergeErrors in
            results.1 = mergeResults.0
            results.2 = mergeResults.1
            errors.1 = mergeErrors.isEmpty ? nil : mergeErrors[0]
            errors.2 = mergeErrors.isEmpty ? nil : mergeErrors[1]
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) {
            errors.0 = errors.0.process()
            if Array(results.0.flatMap{ $0 }).count == a.count, let b = results.1, let c = results.2 {
                success?((results.0.flatMap{ $0 }, b, c))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }

    /// - description: Executes two arrays of tasks and two single tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.

    /// - parameters:
    ///   - a: Array of AsyncTaskVoids associated with the same data type.
    ///   - b: Array of AsyncTaskVoids associated with the same data type.
    ///   - c: Asynchronous AsyncTaskVoid.
    ///   - d: Asynchronous AsyncTaskVoid.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - success: Completion block which is executed when all tasks have completed, ONLY if all included tasks are successful.
    ///   - failure: Completion block which is executed when all tasks have completed, ONLY if at least one included task failed.
    ///   - completion: Completion block which is executed when all tasks have completed, includes succesful response values and errors.
    ///   NOTE (applicable for success/failure/completion):
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding tuple index will be nil, or, if the value is an array, the value at the corresponding array index will be nil.
    ///     3) If a single request failed, the value at corresponding index in the corresponding errors array will be an optional error; other indices will have nil values. If the error is represented singly in a tuple, that tuple index will have an optional error.
    ///     4) If no requests failed, an errors array will be empty.
    
    public static func merge<A, B, C, D>(_ a: [AsyncTaskVoid<A>],
                                         _ b: [AsyncTaskVoid<B>],
                                         _ c: AsyncTaskVoid<C>,
                                         _ d: AsyncTaskVoid<D>,
                                         observeOn: DispatchQueue = DispatchQueue.main,
                                         success: ((([A], [B], C, D)) -> Void)? = nil,
                                         failure: ((([Error?], [Error?], Error?, Error?)) -> Void)? = nil,
                                         completion: ((([A?], [B?], C?, D?), ([Error?], [Error?], Error?, Error?)) -> Void)? = nil) {

        let dispatchGroup = DispatchGroup()
        var errors: ([Error?], [Error?], Error?, Error?) = ([Error?](repeating: nil, count: a.count),
                                                            [Error?](repeating: nil, count: b.count), nil, nil)
        var results: ([A?], [B?], C?, D?) = ([], [], nil, nil)

        dispatchGroup.enter()
        merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors.0 = mergeErrors[0]
            errors.1 = mergeErrors[1]
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        merge(c, d, completion: { mergeResults, mergeErrors in
            results.2 = mergeResults.0
            results.3 = mergeResults.1
            errors.2 = mergeErrors.isEmpty ? nil : mergeErrors[0]
            errors.3 = mergeErrors.isEmpty ? nil : mergeErrors[1]
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) {
            errors.0 = errors.0.process()
            errors.1 = errors.1.process()
            if Array(results.0.flatMap{ $0 }).count == a.count, Array(results.1.flatMap{ $0 }).count == b.count, let c = results.2, let d = results.3 {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, c, d))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
}
