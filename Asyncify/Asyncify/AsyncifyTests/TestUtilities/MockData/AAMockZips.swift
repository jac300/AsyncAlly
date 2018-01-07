//
//  AAMockZipData.swift
//  AsyncifyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import Asyncify

struct AAMockZips {

    static let zip_3_int = [AAMockTasks.mockSuccess6, AAMockTasks.mockSuccess7, AAMockTasks.mockSuccess8]
    static let zip_3_bool = [AAMockTasks.mockSuccess9, AAMockTasks.mockSuccess10, AAMockTasks.mockSuccess11]

    static let zip_2_str = [AAMockTasks.mockSuccess4, AAMockTasks.mockSuccess5]
    static let zip_3_str = [AAMockTasks.mockSuccess1, AAMockTasks.mockSuccess2, AAMockTasks.mockSuccess3]
    static let zip_4_str = [AAMockTasks.mockSuccess3, AAMockTasks.mockSuccess4,
                   AAMockTasks.mockFailure1, AAMockTasks.mockSuccess5]
    static let zip_5_str = [AAMockTasks.mockSuccess1, AAMockTasks.mockSuccess2, AAMockTasks.mockSuccess3,
                   AAMockTasks.mockSuccess4, AAMockTasks.mockSuccess5]

    static let zip_3_strArr = [AAMockTasks.mockSuccess12, AAMockTasks.mockSuccess13, AAMockTasks.mockSuccess14]
    static let zip_4_strArr = [AAMockTasks.mockSuccess12, AAMockTasks.mockSuccess13, AAMockTasks.mockSuccess14,
                               AAMockTasks.mockFailure4]
    static let zip_2_intArr = [AAMockTasks.mockSuccess15, AAMockTasks.mockSuccess16]
    static let zip_1_intArr = [AAMockTasks.mockFailure5]

}

struct AAMockVoidZips {

    static let zip_3_int = [AAMockTasks.mockVoidSuccess6, AAMockTasks.mockVoidSuccess7, AAMockTasks.mockVoidSuccess8]
    static let zip_3_bool = [AAMockTasks.mockVoidSuccess9, AAMockTasks.mockVoidSuccess10, AAMockTasks.mockVoidSuccess11]

    static let zip_2_str = [AAMockTasks.mockVoidSuccess4, AAMockTasks.mockVoidSuccess5]
    static let zip_3_str = [AAMockTasks.mockVoidSuccess1, AAMockTasks.mockVoidSuccess2, AAMockTasks.mockVoidSuccess3]
    static let zip_4_str = [AAMockTasks.mockVoidSuccess3, AAMockTasks.mockVoidSuccess4,
                            AAMockTasks.mockVoidFailure1, AAMockTasks.mockVoidSuccess5]
    static let zip_5_str = [AAMockTasks.mockVoidSuccess1, AAMockTasks.mockVoidSuccess2, AAMockTasks.mockVoidSuccess3,
                            AAMockTasks.mockVoidSuccess4, AAMockTasks.mockVoidSuccess5]

    static let zip_3_strArr = [AAMockTasks.mockVoidSuccess12, AAMockTasks.mockVoidSuccess13, AAMockTasks.mockVoidSuccess14]
    static let zip_4_strArr = [AAMockTasks.mockVoidSuccess12, AAMockTasks.mockVoidSuccess13, AAMockTasks.mockVoidSuccess14,
                               AAMockTasks.mockVoidFailure4]
    static let zip_2_intArr = [AAMockTasks.mockVoidSuccess15, AAMockTasks.mockVoidSuccess16]
    static let zip_1_intArr = [AAMockTasks.mockVoidFailure5]

}
