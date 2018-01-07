//
//  GenerateAATaskObject.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation

struct TaskObjectGenerator<T> {

    static func generateTaskObject(from function: MockAsyncFunctions.FunctionType<T>) -> AATaskObject {

        let task: AATask<T> = { success, failure in
            function(success: { value in
                success(value)
            }, failure: { error in
                failure(error)
            })
        }
        return AATaskObject<T>(task)
    }
}
