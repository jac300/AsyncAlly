//
//  GenerateAATaskObject.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import AsyncAlly

extension AATaskObject {

    static func generateTaskObject(from function: @escaping MockAsyncFunctions.FunctionType<ValueType>) -> AATaskObject<ValueType> {

        let task: AATask<ValueType> = { success, failure in
            function({ value in
                success(value)
            }, { error in
                failure(error)
            })
        }
        return AATaskObject<ValueType>(task)
    }
}
