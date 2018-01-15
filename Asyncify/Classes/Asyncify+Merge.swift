//
//  Async+Merge.swift
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation

public extension Asyncify { //AATask functions
    
    /// - description: Executes two tasks and waits for completion of both tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Asynchronous AATask.
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
    
    @discardableResult public static func merge<A, B>(_ a: AsyncTask<A>,
                                                      _ b: AsyncTask<B>,
                                                      observeOn: DispatchQueue = DispatchQueue.main,
                                                      success: (((A, B)) -> Void)? = nil,
                                                      failure: (([Error?]) -> Void)? = nil,
                                                      completion: (((A?, B?), [Error?]) -> Void)? = nil) -> [URLSessionDataTask] {
        
        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var results: (A?, B?) = (nil, nil)
        var errors: [Error?] = [nil, nil]

        dispatchGroup.enter()
        sessionDataTasks.append(a({ value in
            results.0 = value
            dispatchGroup.leave()
        }, { error in
            errors[0] = error
            dispatchGroup.leave()
        }))
        
        dispatchGroup.enter()
        sessionDataTasks.append(b({ value in
            results.1 = value
            dispatchGroup.leave()
        }, { error in
            errors[1] = error
            dispatchGroup.leave()
        }))
        
        dispatchGroup.notify(queue: observeOn) {
            if let a = results.0, let b = results.1 {
                success?((a, b))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
    
    /// - description: Executes three tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Asynchronous AATask.
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
    
    @discardableResult public static func merge<A, B, C>(_ a: AsyncTask<A>,
                                                         _ b: AsyncTask<B>,
                                                         _ c: AsyncTask<C>,
                                                         observeOn: DispatchQueue = DispatchQueue.main,
                                                         success: (((A, B, C)) -> Void)? = nil,
                                                         failure: (([Error?]) -> Void)? = nil,
                                                         completion: (((A?, B?, C?), [Error?]) -> Void)? = nil) -> [URLSessionDataTask] {
        
        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error?](repeating: nil, count: 3)
        var results: (A?, B?, C?) = (nil, nil, nil)
        
        dispatchGroup.enter()
        sessionDataTasks += merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors[0] = mergeErrors[0]
            errors[1] = mergeErrors[1]
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        sessionDataTasks.append(c({ value in
            results.2 = value
            dispatchGroup.leave()
        }, { error in
            errors[2] = error
            dispatchGroup.leave()
        }))
        
        dispatchGroup.notify(queue: observeOn) {
            if let a = results.0, let b = results.1, let c = results.2 {
                success?((a, b, c))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
    
    /// - description: Executes four tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Asynchronous AATask.
    ///   - b: Asynchronous AATask.
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
    
    @discardableResult public static func merge<A, B, C, D>(_ a: AsyncTask<A>,
                                                            _ b: AsyncTask<B>,
                                                            _ c: AsyncTask<C>,
                                                            _ d: AsyncTask<D>,
                                                            observeOn: DispatchQueue = DispatchQueue.main,
                                                            success: (((A, B, C, D)) -> Void)? = nil,
                                                            failure: (([Error?]) -> Void)? = nil,
                                                            completion: (((A?, B?, C?, D?), [Error?]) -> Void)? = nil) -> [URLSessionDataTask] {
        
        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error?](repeating: nil, count: 4)
        var results: (A?, B?, C?, D?) = (nil, nil, nil, nil)
        
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
            if let a = results.0, let b = results.1, let c = results.2, let d = results.3 {
                success?((a, b, c, d))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
    
    /// - description: Executes five tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Asynchronous AATask.
    ///   - b: Asynchronous AATask.
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
    
    @discardableResult public static func merge<A, B, C, D, E>(_ a: AsyncTask<A>,
                                                               _ b: AsyncTask<B>,
                                                               _ c: AsyncTask<C>,
                                                               _ d: AsyncTask<D>,
                                                               _ e: AsyncTask<E>,
                                                               observeOn: DispatchQueue = DispatchQueue.main,
                                                               success: (((A, B, C, D, E)) -> Void)? = nil,
                                                               failure: (([Error?]) -> Void)? = nil,
                                                               completion: (((A?, B?, C?, D?, E?), [Error?]) -> Void)? = nil) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error?](repeating: nil, count: 5)
        var results: (A?, B?, C?, D?, E?) = (nil, nil, nil, nil, nil)

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
            if let a = results.0, let b = results.1, let c = results.2, let d = results.3, let e = results.4 {
                success?((a, b, c, d, e))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
        return sessionDataTasks
    }
}

public extension Asyncify { //AATaskVoid functions
    
    /// - description: Executes two tasks and waits for completion of both tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Asynchronous AATaskVoid.
    ///   - b: Asynchronous AATaskVoid.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    public static func merge<A, B>(_ a: AsyncTaskVoid<A>,
                                   _ b: AsyncTaskVoid<B>,
                                   observeOn: DispatchQueue = DispatchQueue.main,
                                   success: (((A, B)) -> Void)? = nil,
                                   failure: (([Error?]) -> Void)? = nil,
                                   completion: (((A?, B?), [Error?]) -> Void)? = nil) {
        
        let dispatchGroup = DispatchGroup()
        var errors = [Error?](repeating: nil, count: 2)
        var results: (A?, B?) = (nil, nil)
        
        dispatchGroup.enter()
        a({ value in
            results.0 = value
            dispatchGroup.leave()
        }, { error in
            errors[0] = error
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        b({ value in
            results.1 = value
            dispatchGroup.leave()
        }, { error in
            errors[1] = error
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: observeOn) {
            if let a = results.0, let b = results.1 {
                success?((a, b))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
    
    /// - description: Executes three tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Asynchronous AATaskVoid.
    ///   - b: Asynchronous AATaskVoid.
    ///   - c: Asynchronous AATaskVoid.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    public static func merge<A, B, C>(_ a: AsyncTaskVoid<A>,
                                      _ b: AsyncTaskVoid<B>,
                                      _ c: AsyncTaskVoid<C>,
                                      observeOn: DispatchQueue = DispatchQueue.main,
                                      success: (((A, B, C)) -> Void)? = nil,
                                      failure: (([Error?]) -> Void)? = nil,
                                      completion: (((A?, B?, C?), [Error?]) -> Void)? = nil) {
        
        let dispatchGroup = DispatchGroup()
        var errors = [Error?](repeating: nil, count: 3)
        var results: (A?, B?, C?) = (nil, nil, nil)
        
        dispatchGroup.enter()
        merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors[0] = mergeErrors[0]
            errors[1] = mergeErrors[1]
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        c({ value in
            results.2 = value
            dispatchGroup.leave()
        }, { error in
            errors[2] = error
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: observeOn) {
            if let a = results.0, let b = results.1, let c = results.2 {
                success?((a, b, c))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
    
    /// - description: Executes four tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Asynchronous AATaskVoid.
    ///   - b: Asynchronous AATaskVoid.
    ///   - c: Asynchronous AATaskVoid.
    ///   - d: Asynchronous AATaskVoid.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    public static func merge<A, B, C, D>(_ a: AsyncTaskVoid<A>,
                                         _ b: AsyncTaskVoid<B>,
                                         _ c: AsyncTaskVoid<C>,
                                         _ d: AsyncTaskVoid<D>,
                                         observeOn: DispatchQueue = DispatchQueue.main,
                                         success: (((A, B, C, D)) -> Void)? = nil,
                                         failure: (([Error?]) -> Void)? = nil,
                                         completion: (((A?, B?, C?, D?), [Error?]) -> Void)? = nil) {
        
        let dispatchGroup = DispatchGroup()
        var errors = [Error?](repeating: nil, count: 4)
        var results: (A?, B?, C?, D?) = (nil, nil, nil, nil)
        
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
            if let a = results.0, let b = results.1, let c = results.2, let d = results.3 {
                success?((a, b, c, d))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
    
    /// - description: Executes five tasks and waits for completion of all tasks, collecting valid results and errors.
    ///
    /// - NOTE: Be sure that your asynchronous tasks are performed on a different queue than completion is observed on.
    
    /// - parameters:
    ///   - a: Asynchronous AATaskVoid.
    ///   - b: Asynchronous AATaskVoid.
    ///   - c: Asynchronous AATaskVoid.
    ///   - d: Asynchronous AATaskVoid.
    ///   - observeOn: queue to observe completion on. This queue should be different from that which your asynchronous task
    ///     is performed. Default value is main unless you specify otherwise.
    ///   - completion: Completion block which is executed when all tasks have completed.
    ///   NOTE:
    ///     1) Successful values will be returned in the SAME ORDER as the tasks array. (i.e. a -> results.0)
    ///     2) If a single request failed, the value at corresponding index in the results array will be nil. If there is an error
    ///         returned from your asynchronous request, there will also be an error for that request in an error array.
    
    public static func merge<A, B, C, D, E>(_ a: AsyncTaskVoid<A>,
                                            _ b: AsyncTaskVoid<B>,
                                            _ c: AsyncTaskVoid<C>,
                                            _ d: AsyncTaskVoid<D>,
                                            _ e: AsyncTaskVoid<E>,
                                            observeOn: DispatchQueue = DispatchQueue.main,
                                            success: (((A, B, C, D, E)) -> Void)? = nil,
                                            failure: (([Error?]) -> Void)? = nil,
                                            completion: (((A?, B?, C?, D?, E?), [Error?]) -> Void)? = nil) {
        
        let dispatchGroup = DispatchGroup()
        var errors = [Error?](repeating: nil, count: 5)
        var results: (A?, B?, C?, D?, E?) = (nil, nil, nil, nil, nil)
        
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
            if let a = results.0, let b = results.1, let c = results.2, let d = results.3, let e = results.4 {
                success?((a, b, c, d, e))
            } else {
                failure?(errors)
            }
            completion?(results, errors)
        }
    }
}
