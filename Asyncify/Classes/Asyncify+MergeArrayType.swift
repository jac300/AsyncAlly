//
//  Asyncify+MergeArrayType.swift
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation

public extension Asyncify { //AATask functions
    
    /// - description: Executes an array of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - tasks: Array of AATasks associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. task[0] -> results[0])
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    ///
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.
    
    @discardableResult public static func merge<A>(_ a: [AsyncTask<A>],
                                                   observeOn: DispatchQueue = DispatchQueue.main,
                                                   success: (([A]) -> Void)? = nil,
                                                   failure: (([Error?]) -> Void)? = nil,
                                                   completion: (([A?], [Error?]) -> Void)? = nil) -> [URLSessionDataTask] {
        
        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error?](repeating: nil, count: a.count)
        var results = [A?](repeating: nil, count: a.count)
        
        for i in 0..<a.count {
            let task = a[i]
            dispatchGroup.enter()
            sessionDataTasks.append(task({ value in
                results[i] = value
                dispatchGroup.leave()
            }, { error in
                errors[i] = error
                dispatchGroup.leave()
            }))
        }
        
        dispatchGroup.notify(queue: observeOn) {
            if Array(results.flatMap{ $0 }).count == a.count {
                success?(results.flatMap{ $0 })
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
    
    /// - description: Executes two arrays of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Array of AATasks associated with the same data type.
    ///   - b: Array of AATasks associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    ///
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.
    
    @discardableResult public static func merge<A, B>(_ a: [AsyncTask<A>],
                                                      _ b: [AsyncTask<B>],
                                                      observeOn: DispatchQueue = DispatchQueue.main,
                                                      success: ((([A], [B])) -> Void)? = nil,
                                                      failure: (([[Error?]]) -> Void)? = nil,
                                                      completion: ((([A?], [B?]), [[Error?]]) -> Void)? = nil) -> [URLSessionDataTask] {
        
        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [[Error?](repeating: nil, count: a.count), [Error?](repeating: nil, count: b.count)]
        var results: ([A?], [B?]) = ([], [])
        
        dispatchGroup.enter()
        sessionDataTasks += merge(a, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults
            errors[0] = mergeErrors
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        sessionDataTasks += merge(b, completion: { mergeResults, mergeErrors in
            results.1 = mergeResults
            errors[1] = mergeErrors
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: observeOn) {
            if Array(results.0.flatMap{ $0 }).count == a.count && Array(results.1.flatMap{ $0 }).count == b.count {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
    
    /// - description: Executes three arrays of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Array of AATasks associated with the same data type.
    ///   - b: Array of AATasks associated with the same data type.
    ///   - c: Array of AATasks associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    ///
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.
    
    @discardableResult public static func merge<A, B, C>(_ a: [AsyncTask<A>],
                                                         _ b: [AsyncTask<B>],
                                                         _ c: [AsyncTask<C>],
                                                         observeOn: DispatchQueue = DispatchQueue.main,
                                                         success: ((([A], [B], [C])) -> Void)? = nil,
                                                         failure: (([[Error?]]) -> Void)? = nil,
                                                         completion: ((([A?], [B?], [C?]), [[Error?]]) -> Void)? = nil) -> [URLSessionDataTask] {
        
        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [[Error?](repeating: nil, count: a.count), [Error?](repeating: nil, count: b.count),
                      [Error?](repeating: nil, count: c.count)]
        var results: ([A?], [B?], [C?]) = ([], [], [])
        
        dispatchGroup.enter()
        sessionDataTasks += merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors[0] = mergeErrors[0]
            errors[1] = mergeErrors[1]
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        sessionDataTasks += merge(c, completion: { mergeResults, mergeErrors in
            results.2 = mergeResults
            errors[2] = mergeErrors
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: observeOn) {
            if Array(results.0.flatMap{ $0 }).count == a.count && Array(results.1.flatMap{ $0 }).count == b.count &&
                results.2.count == c.count {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, results.2.flatMap{ $0 }))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
    
    /// - description: Executes four arrays of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Array of AATasks associated with the same data type.
    ///   - b: Array of AATasks associated with the same data type.
    ///   - c: Array of AATasks associated with the same data type.
    ///   - d: Array of AATasks associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    ///
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.
    
    @discardableResult public static func merge<A, B, C, D>(_ a: [AsyncTask<A>],
                                                            _ b: [AsyncTask<B>],
                                                            _ c: [AsyncTask<C>],
                                                            _ d: [AsyncTask<D>],
                                                            observeOn: DispatchQueue = DispatchQueue.main,
                                                            success: ((([A], [B], [C], [D])) -> Void)? = nil,
                                                            failure: (([[Error?]]) -> Void)? = nil,
                                                            completion: ((([A?], [B?], [C?], [D?]), [[Error?]]) -> Void)? = nil) -> [URLSessionDataTask] {
        
        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [[Error?](repeating: nil, count: a.count), [Error?](repeating: nil, count: b.count),
                      [Error?](repeating: nil, count: c.count), [Error?](repeating: nil, count: d.count)]
        var results: ([A?], [B?], [C?], [D?]) = ([], [], [], [])
        
        dispatchGroup.enter()
        sessionDataTasks += merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors[0] = mergeErrors[0]
            errors[1] = mergeErrors[1]
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        sessionDataTasks += merge(c, d, completion: { mergeResults, mergeErrors in
            results.2 = mergeResults.0
            results.3 = mergeResults.1
            errors[2] = mergeErrors[0]
            errors[3] = mergeErrors[1]
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: observeOn) {
            if Array(results.0.flatMap{ $0 }).count == a.count && Array(results.1.flatMap{ $0 }).count == b.count &&
                results.2.count == c.count
                && Array(results.3.flatMap{ $0 }).count == d.count {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, results.2.flatMap{ $0 }, results.3.flatMap{ $0 }))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
    
    /// - description: Executes five arrays of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Array of AATasks associated with the same data type.
    ///   - b: Array of AATasks associated with the same data type.
    ///   - c: Array of AATasks associated with the same data type.
    ///   - d: Array of AATasks associated with the same data type.
    ///   - e: Array of AATasks associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    ///
    /// - [URLSessionDataTask]: Task objects collected and returned from your asynchronous tasks.
    
    @discardableResult public static func merge<A, B, C, D, E>(_ a: [AsyncTask<A>],
                                                               _ b: [AsyncTask<B>],
                                                               _ c: [AsyncTask<C>],
                                                               _ d: [AsyncTask<D>],
                                                               _ e: [AsyncTask<E>],
                                                               observeOn: DispatchQueue = DispatchQueue.main,
                                                               success: ((([A], [B], [C], [D], [E])) -> Void)? = nil,
                                                               failure: (([[Error?]]) -> Void)? = nil,
                                                               completion: ((([A?], [B?], [C?], [D?], [E?]), [[Error?]]) -> Void)? = nil) -> [URLSessionDataTask] {
        
        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [[Error?](repeating: nil, count: a.count), [Error?](repeating: nil, count: b.count),
                      [Error?](repeating: nil, count: c.count), [Error?](repeating: nil, count: d.count),
                       [Error?](repeating: nil, count: e.count)]
        var results: ([A?], [B?], [C?], [D?], [E?]) = ([], [], [], [], [])
        
        dispatchGroup.enter()
        sessionDataTasks += merge(a, b, c, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            results.2 = mergeResults.2
            errors[0] = mergeErrors[0]
            errors[1] = mergeErrors[1]
            errors[2] = mergeErrors[2]
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        sessionDataTasks += merge(d, e, completion: { mergeResults, mergeErrors in
            results.3 = mergeResults.0
            results.4 = mergeResults.1
            errors[3] = mergeErrors[0]
            errors[4] = mergeErrors[1]
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: observeOn) {
            if Array(results.0.flatMap{ $0 }).count == a.count && Array(results.1.flatMap{ $0 }).count == b.count &&
                results.2.count == c.count
                && Array(results.3.flatMap{ $0 }).count == d.count && Array(results.4.flatMap{ $0 }).count == e.count {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, results.2.flatMap{ $0 },
                          results.3.flatMap{ $0 }, results.4.flatMap{ $0 }))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
    
    /// - description: Executes an array of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - tasks: Array of AATaskVoids associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. task[0] -> results[0])
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    ///
}
public extension Asyncify { //AATaskVoid functions
    
    /// - description: Executes an array of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - tasks: Array of AATaskVoids associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. task[0] -> results[0])
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    public static func merge<A>(_ tasks: [AsyncTaskVoid<A>],
                                observeOn: DispatchQueue = DispatchQueue.main,
                                success: (([A]) -> Void)? = nil,
                                failure: (([Error?]) -> Void)? = nil,
                                completion: (([A?], [Error?]) -> Void)? = nil) {
        
        let dispatchGroup = DispatchGroup()
        var errors = [Error?](repeating: nil, count: tasks.count)
        var results = [A?](repeating: nil, count: tasks.count)
        
        for i in 0..<tasks.count {
            let task = tasks[i]
            dispatchGroup.enter()
            task({ value in
                results[i] = value
                dispatchGroup.leave()
            }, { error in
                errors[i] = error
                dispatchGroup.leave()
            })
        }
        
        dispatchGroup.notify(queue: observeOn) {
            if results.count == tasks.count {
                success?(results.flatMap{ $0 })
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
    
    /// - description: Executes two arrays of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Array of AATaskVoids associated with the same data type.
    ///   - b: Array of AATaskVoids associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    public static func merge<A, B>(_ a: [AsyncTaskVoid<A>],
                                   _ b: [AsyncTaskVoid<B>],
                                   observeOn: DispatchQueue = DispatchQueue.main,
                                   success: ((([A], [B])) -> Void)? = nil,
                                   failure: (([[Error?]]) -> Void)? = nil,
                                   completion: ((([A?], [B?]), [[Error?]]) -> Void)? = nil) {
        
        let dispatchGroup = DispatchGroup()
        var errors = [[Error?](repeating: nil, count: a.count), [Error?](repeating: nil, count: b.count)]
        var results: ([A?], [B?]) = ([], [])
        
        dispatchGroup.enter()
        merge(a, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults
            errors[0] = mergeErrors
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        merge(b, completion: { mergeResults, mergeErrors in
            results.1 = mergeResults
            errors[1] = mergeErrors
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: observeOn) {
            if Array(results.0.flatMap{ $0 }).count == a.count && Array(results.1.flatMap{ $0 }).count == b.count {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
    
    /// - description: Executes three arrays of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Array of AATaskVoids associated with the same data type.
    ///   - b: Array of AATaskVoids associated with the same data type.
    ///   - c: Array of AATaskVoids associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    public static func merge<A, B, C>(_ a: [AsyncTaskVoid<A>],
                                      _ b: [AsyncTaskVoid<B>],
                                      _ c: [AsyncTaskVoid<C>],
                                      observeOn: DispatchQueue = DispatchQueue.main,
                                      success: ((([A], [B], [C])) -> Void)? = nil,
                                      failure: (([[Error?]]) -> Void)? = nil,
                                      completion: ((([A?], [B?], [C?]), [[Error?]]) -> Void)? = nil) {
        
        let dispatchGroup = DispatchGroup()
        var errors = [[Error?](repeating: nil, count: a.count), [Error?](repeating: nil, count: b.count),
                      [Error?](repeating: nil, count: c.count)]
        var results: ([A?], [B?], [C?]) = ([], [], [])
        
        dispatchGroup.enter()
        merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors[0] = mergeErrors[0]
            errors[1] = mergeErrors[1]
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        merge(c, completion: { mergeResults, mergeErrors in
            results.2 = mergeResults
            errors[2] = mergeErrors
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: observeOn) {
            if Array(results.0.flatMap{ $0 }).count == a.count && Array(results.1.flatMap{ $0 }).count == b.count &&
                results.2.count == c.count {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, results.2.flatMap{ $0 }))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
    
    /// - description: Executes four arrays of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Array of AATaskVoids associated with the same data type.
    ///   - b: Array of AATaskVoids associated with the same data type.
    ///   - c: Array of AATaskVoids associated with the same data type.
    ///   - d: Array of AATaskVoids associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    public static func merge<A, B, C, D>(_ a: [AsyncTaskVoid<A>],
                                         _ b: [AsyncTaskVoid<B>],
                                         _ c: [AsyncTaskVoid<C>],
                                         _ d: [AsyncTaskVoid<D>],
                                         observeOn: DispatchQueue = DispatchQueue.main,
                                         success: ((([A], [B], [C], [D])) -> Void)? = nil,
                                         failure: (([[Error?]]) -> Void)? = nil,
                                         completion: ((([A?], [B?], [C?], [D?]), [[Error?]]) -> Void)? = nil) {
        
        let dispatchGroup = DispatchGroup()
        var errors = [[Error?](repeating: nil, count: a.count), [Error?](repeating: nil, count: b.count),
                      [Error?](repeating: nil, count: c.count), [Error?](repeating: nil, count: d.count)]
        var results: ([A?], [B?], [C?], [D?]) = ([], [], [], [])
        
        dispatchGroup.enter()
        merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors[0] = mergeErrors[0]
            errors[1] = mergeErrors[1]
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        merge(c, d, completion: { mergeResults, mergeErrors in
            results.2 = mergeResults.0
            results.3 = mergeResults.1
            errors[2] = mergeErrors[0]
            errors[3] = mergeErrors[1]
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: observeOn) {
            if Array(results.0.flatMap{ $0 }).count == a.count && Array(results.1.flatMap{ $0 }).count == b.count && results.2.count == c.count
                && Array(results.3.flatMap{ $0 }).count == d.count {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, results.2.flatMap{ $0 },
                          results.3.flatMap{ $0 }))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
    
    /// - description: Executes five arrays of tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Array of AATaskVoids associated with the same data type.
    ///   - b: Array of AATaskVoids associated with the same data type.
    ///   - c: Array of AATaskVoids associated with the same data type.
    ///   - d: Array of AATaskVoids associated with the same data type.
    ///   - e: Array of AATaskVoids associated with the same data type.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    public static func merge<A, B, C, D, E>(_ a: [AsyncTaskVoid<A>],
                                                               _ b: [AsyncTaskVoid<B>],
                                                               _ c: [AsyncTaskVoid<C>],
                                                               _ d: [AsyncTaskVoid<D>],
                                                               _ e: [AsyncTaskVoid<E>],
                                                               observeOn: DispatchQueue = DispatchQueue.main,
                                                               success: ((([A], [B], [C], [D], [E])) -> Void)? = nil,
                                                               failure: (([[Error?]]) -> Void)? = nil,
                                                               completion: ((([A?], [B?], [C?], [D?], [E?]), [[Error?]]) -> Void)? = nil) {

        let dispatchGroup = DispatchGroup()
        var errors = [[Error?](repeating: nil, count: a.count), [Error?](repeating: nil, count: b.count),
                      [Error?](repeating: nil, count: c.count), [Error?](repeating: nil, count: d.count),
                      [Error?](repeating: nil, count: e.count)]
        var results: ([A?], [B?], [C?], [D?], [E?]) = ([], [], [], [], [])

        dispatchGroup.enter()
        merge(a, b, c, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            results.2 = mergeResults.2
            errors[0] = mergeErrors[0]
            errors[1] = mergeErrors[1]
            errors[2] = mergeErrors[2]
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        merge(d, e, completion: { mergeResults, mergeErrors in
            results.3 = mergeResults.0
            results.4 = mergeResults.1
            errors[3] = mergeErrors[0]
            errors[4] = mergeErrors[1]
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) {
            print(results)
            if Array(results.0.flatMap{ $0 }).count == a.count && Array(results.1.flatMap{ $0 }).count == b.count &&
                results.2.count == c.count
                && Array(results.3.flatMap{ $0 }).count == d.count && Array(results.4.flatMap{ $0 }).count == e.count {
                success?((results.0.flatMap{ $0 }, results.1.flatMap{ $0 }, results.2.flatMap{ $0 },
                          results.3.flatMap{ $0 }, results.4.flatMap{ $0 }))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
}
