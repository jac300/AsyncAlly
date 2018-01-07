import Foundation

extension AsyncAlly {

    @discardableResult static func combine<A, B>(_ a: [AATaskObject<A>],
                                                 _ b: AATaskObject<B>,
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

    @discardableResult static func combine<A, B, C>(_ a: [AATaskObject<A>],
                                                    _ b: [AATaskObject<B>],
                                                    _ c: AATaskObject<C>,
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

    @discardableResult static func combine<A, B, C>(_ a: [AATaskObject<A>],
                                                    _ b: AATaskObject<B>,
                                                    _ c: AATaskObject<C>,
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

    @discardableResult static func combine<A, B, C, D>(_ a: [AATaskObject<A>],
                                                       _ b: [AATaskObject<B>],
                                                       _ c: AATaskObject<C>,
                                                       _ d: AATaskObject<D>,
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
