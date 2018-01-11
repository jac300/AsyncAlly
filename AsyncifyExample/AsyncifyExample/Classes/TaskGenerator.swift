//
//  TaskGenerator.swift
//  AsyncifyExample
//
//  Created by Jennifer Clark on 1/7/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
import Asyncify

typealias FunctionType<T> = (@escaping (T) -> Void, @escaping (Error?) -> Void) -> Void

class TaskGenerator {
    static func generateTask<T>(from function: @escaping FunctionType<T>) -> AsyncTaskVoid<T> {
        return { success, failure in
            function({ value in
                success(value)
            }, { error in
                failure(error)
            })
        }
    }
}
