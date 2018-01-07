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

}
