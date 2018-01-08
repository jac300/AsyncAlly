//
//  AsyncTaskGenerator.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import Asyncify

func generateAsyncTask<T>(from function: @escaping AsyncMockFunctions.FunctionType<T>) -> AsyncTask<T> {

    return { success, failure in
        return function({ value in
            success(value)
        }, { error in
            failure(error)
        })
    }
}

func generateAsyncVoidTask<T>(from function: @escaping AsyncMockFunctions.FunctionTypeVoid<T>) -> AsyncTaskVoid<T> {

    return { success, failure in
        function({ value in
            success(value)
        }, { error in
            failure(error)
        })
    }
}
