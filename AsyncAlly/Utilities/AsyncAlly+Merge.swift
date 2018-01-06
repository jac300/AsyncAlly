import Foundation

extension AsyncAlly {

    static func merge<A, B>(_ a: AATaskObject<A>,
                            _ b: AATaskObject<B>,
                            observeOn: DispatchQueue = DispatchQueue.main,
                            completion: @escaping ((A?, B?), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: (A?, B?) = (nil, nil)

        dispatchGroup.enter()
        sessionDataTasks.append(a.task({ value in
            results.0 = value
            dispatchGroup.leave()
            }, { error in
                if let error = error { errors.append(error) }
                dispatchGroup.leave()
        }))

        dispatchGroup.enter()
        sessionDataTasks.append(b.task({ value in
            results.1 = value
            dispatchGroup.leave()
            }, { error in
                if let error = error { errors.append(error) }
                dispatchGroup.leave()
        }))

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }

    static func merge<A, B, C>(_ a: AATaskObject<A>,
                               _ b: AATaskObject<B>,
                               _ c: AATaskObject<C>,
                               observeOn: DispatchQueue = DispatchQueue.main,
                               completion: @escaping ((A?, B?, C?), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: (A?, B?, C?) = (nil, nil, nil)

        dispatchGroup.enter()
        sessionDataTasks += merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors += mergeErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks.append(c.task({ value in
            results.2 = value
            dispatchGroup.leave()
            }, { error in
                if let error = error { errors.append(error) }
                dispatchGroup.leave()
        }))

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }

    static func merge<A, B, C, D>(_ a: AATaskObject<A>,
                                  _ b: AATaskObject<B>,
                                  _ c: AATaskObject<C>,
                                  _ d: AATaskObject<D>,
                                  observeOn: DispatchQueue = DispatchQueue.main,
                                  completion: @escaping ((A?, B?, C?, D?), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: (A?, B?, C?, D?) = (nil, nil, nil, nil)

        dispatchGroup.enter()
        sessionDataTasks += merge(a, b, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            errors += mergeErrors
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

    static func merge<A, B, C, D, E>(_ a: AATaskObject<A>,
                                     _ b: AATaskObject<B>,
                                     _ c: AATaskObject<C>,
                                     _ d: AATaskObject<D>,
                                     _ e: AATaskObject<E>,
                                     observeOn: DispatchQueue = DispatchQueue.main,
                                     completion: @escaping ((A?, B?, C?, D?, E?), [Error]) -> Void) -> [URLSessionDataTask] {

        var sessionDataTasks = [URLSessionDataTask]()
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var results: (A?, B?, C?, D?, E?) = (nil, nil, nil, nil, nil)

        dispatchGroup.enter()
        sessionDataTasks += merge(a, b, c, completion: { mergeResults, mergeErrors in
            results.0 = mergeResults.0
            results.1 = mergeResults.1
            results.2 = mergeResults.2
            errors += mergeErrors
            dispatchGroup.leave()
        })

        dispatchGroup.enter()
        sessionDataTasks += merge(d, e, completion: { mergeResults, mergeErrors in
            results.3 = mergeResults.0
            results.4 = mergeResults.1
            errors += mergeErrors
            dispatchGroup.leave()
        })

        dispatchGroup.notify(queue: observeOn) { completion(results, errors) }
        return sessionDataTasks
    }
}
