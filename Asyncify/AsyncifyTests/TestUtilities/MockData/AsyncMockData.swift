//
//  AsyncMockData.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import Asyncify

struct AsyncMockData {

    static let merge_3_int = [AsyncMockTasks.mockSuccess6, AsyncMockTasks.mockSuccess7, AsyncMockTasks.mockSuccess8]
    static let merge_3_bool = [AsyncMockTasks.mockSuccess9, AsyncMockTasks.mockSuccess10, AsyncMockTasks.mockSuccess11]

    static let merge_2_str = [AsyncMockTasks.mockSuccess4, AsyncMockTasks.mockSuccess5]
    static let merge_3_str = [AsyncMockTasks.mockSuccess1, AsyncMockTasks.mockSuccess2, AsyncMockTasks.mockSuccess3]
    static let merge_4_str = [AsyncMockTasks.mockSuccess3, AsyncMockTasks.mockSuccess4,
                   AsyncMockTasks.mockFailure1, AsyncMockTasks.mockSuccess5]
    static let merge_5_str = [AsyncMockTasks.mockSuccess1, AsyncMockTasks.mockSuccess2, AsyncMockTasks.mockSuccess3,
                   AsyncMockTasks.mockSuccess4, AsyncMockTasks.mockSuccess5]

    static let merge_3_strArr = [AsyncMockTasks.mockSuccess12, AsyncMockTasks.mockSuccess13, AsyncMockTasks.mockSuccess14]
    static let merge_4_strArr = [AsyncMockTasks.mockSuccess12, AsyncMockTasks.mockSuccess13, AsyncMockTasks.mockSuccess14,
                               AsyncMockTasks.mockFailure4]
    static let merge_2_intArr = [AsyncMockTasks.mockSuccess15, AsyncMockTasks.mockSuccess16]
    static let merge_1_intArr = [AsyncMockTasks.mockFailure5]

}

struct AAMockVoidData {

    static let merge_3_int = [AsyncMockTasks.mockVoidSuccess6, AsyncMockTasks.mockVoidSuccess7, AsyncMockTasks.mockVoidSuccess8]
    static let merge_3_bool = [AsyncMockTasks.mockVoidSuccess9, AsyncMockTasks.mockVoidSuccess10, AsyncMockTasks.mockVoidSuccess11]

    static let merge_2_str = [AsyncMockTasks.mockVoidSuccess4, AsyncMockTasks.mockVoidSuccess5]
    static let merge_3_str = [AsyncMockTasks.mockVoidSuccess1, AsyncMockTasks.mockVoidSuccess2, AsyncMockTasks.mockVoidSuccess3]
    static let merge_4_str = [AsyncMockTasks.mockVoidSuccess3, AsyncMockTasks.mockVoidSuccess4,
                            AsyncMockTasks.mockVoidFailure1, AsyncMockTasks.mockVoidSuccess5]
    static let merge_5_str = [AsyncMockTasks.mockVoidSuccess1, AsyncMockTasks.mockVoidSuccess2, AsyncMockTasks.mockVoidSuccess3,
                            AsyncMockTasks.mockVoidSuccess4, AsyncMockTasks.mockVoidSuccess5]

    static let merge_3_strArr = [AsyncMockTasks.mockVoidSuccess12, AsyncMockTasks.mockVoidSuccess13, AsyncMockTasks.mockVoidSuccess14]
    static let merge_4_strArr = [AsyncMockTasks.mockVoidSuccess12, AsyncMockTasks.mockVoidSuccess13, AsyncMockTasks.mockVoidSuccess14,
                               AsyncMockTasks.mockVoidFailure4]
    static let merge_2_intArr = [AsyncMockTasks.mockVoidSuccess15, AsyncMockTasks.mockVoidSuccess16]
    static let merge_1_intArr = [AsyncMockTasks.mockVoidFailure5]

}
