//
//  AA+Combine.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation

extension AsyncAlly {

    @discardableResult static func zip<A>(_ tasks: [AATask<A>],
                                          observeOn: DispatchQueue = DispatchQueue.main,
                                          completion: @escaping (([A?]), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results = [A?](repeating: nil, count: tasks.count)

        for i in 0..<tasks.count {
            let task = tasks[i]
            dispatchGroup.enter()
            sessionDataTasks.append(task({ value in
                results[i] = value
                dispatchGroup.leave()
            }, { error in
                if let error = error { errors.append(error) }
                dispatchGroup.leave()
            }))
        }

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }

    @discardableResult static func zip<A, B>(_ a: [AATask<A>],
                                             _ b: [AATask<B>],
                                             observeOn: DispatchQueue = DispatchQueue.main,
                                             completion: @escaping (([A?], [B?]), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: ([A?], [B?]) = ([], [])

        dispatchGroup.enter()
        sessionDataTasks += zip(a, completion: { zipResults, zipErrors in
            results.0 = zipResults
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks += zip(b, completion: { zipResults, zipErrors in
            results.1 = zipResults
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }

    @discardableResult static func zip<A, B, C>(_ a: [AATask<A>],
                                                _ b: [AATask<B>],
                                                _ c: [AATask<C>],
                                                observeOn: DispatchQueue = DispatchQueue.main,
                                                completion: @escaping (([A?], [B?], [C?]), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: ([A?], [B?], [C?]) = ([], [], [])

        dispatchGroup.enter()
        sessionDataTasks += zip(a, b, completion: { zipResults, zipErrors in
            results.0 = zipResults.0
            results.1 = zipResults.1
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks += zip(c, completion: { zipResults, zipErrors in
            results.2 = zipResults
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }

    @discardableResult static func zip<A, B, C, D>(_ a: [AATask<A>],
                                                   _ b: [AATask<B>],
                                                   _ c: [AATask<C>],
                                                   _ d: [AATask<D>],
                                                   observeOn: DispatchQueue = DispatchQueue.main,
                                                   completion: @escaping (([A?], [B?], [C?], [D?]), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: ([A?], [B?], [C?], [D?]) = ([], [], [], [])

        dispatchGroup.enter()
        sessionDataTasks += zip(a, b, completion: { zipResults, zipErrors in
            results.0 = zipResults.0
            results.1 = zipResults.1
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks += zip(c, d, completion: { zipResults, zipErrors in
            results.2 = zipResults.0
            results.3 = zipResults.1
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }

    @discardableResult static func zip<A, B, C, D, E>(_ a: [AATask<A>],
                                                      _ b: [AATask<B>],
                                                      _ c: [AATask<C>],
                                                      _ d: [AATask<D>],
                                                      _ e: [AATask<E>],
                                                      observeOn: DispatchQueue = DispatchQueue.main,
                                                      completion: @escaping (([A?], [B?], [C?], [D?], [E?]), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: ([A?], [B?], [C?], [D?], [E?]) = ([], [], [], [], [])

        dispatchGroup.enter()
        sessionDataTasks += zip(a, b, c, completion: { zipResults, zipErrors in
            results.0 = zipResults.0
            results.1 = zipResults.1
            results.2 = zipResults.2
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks += zip(d, e, completion: { zipResults, zipErrors in
            results.3 = zipResults.0
            results.4 = zipResults.1
            errors += zipErrors
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }
}
