//
//  AATaskGenerator.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import AsyncAlly

func generateTaskObject<T>(from function: @escaping MockAsyncFunctions.FunctionType<T>) -> AATask<T> {

    return { success, failure in
        function({ value in
            success(value)
        }, { error in
            failure(error)
        })
    }
}

