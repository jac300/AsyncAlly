//
//  AAMockZipData.swift
//  AsyncAllyTests
//
//  Created by Jennifer Clark on 1/6/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation
@testable import AsyncAlly

struct AAMockZips {

    static let zip_3_int = [AAMockTaskObjects.mockSuccess6, AAMockTaskObjects.mockSuccess7, AAMockTaskObjects.mockSuccess8]
    static let zip_3_bool = [AAMockTaskObjects.mockSuccess9, AAMockTaskObjects.mockSuccess10, AAMockTaskObjects.mockSuccess11]

    static let zip_2_str = [AAMockTaskObjects.mockSuccess4, AAMockTaskObjects.mockSuccess5]
    static let zip_3_str = [AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockSuccess2, AAMockTaskObjects.mockSuccess3]
    static let zip_4_str = [AAMockTaskObjects.mockSuccess3, AAMockTaskObjects.mockSuccess4,
                   AAMockTaskObjects.mockFailure1, AAMockTaskObjects.mockSuccess5]
    static let zip_5_str = [AAMockTaskObjects.mockSuccess1, AAMockTaskObjects.mockSuccess2, AAMockTaskObjects.mockSuccess3,
                   AAMockTaskObjects.mockSuccess4, AAMockTaskObjects.mockSuccess5]

    static let zip_3_strArr = [AAMockTaskObjects.mockSuccess12, AAMockTaskObjects.mockSuccess13, AAMockTaskObjects.mockSuccess14]
    static let zip_4_strArr = [AAMockTaskObjects.mockSuccess12, AAMockTaskObjects.mockSuccess13, AAMockTaskObjects.mockSuccess14,
                               AAMockTaskObjects.mockFailure4]
    static let zip_2_intArr = [AAMockTaskObjects.mockSuccess15, AAMockTaskObjects.mockSuccess16]

}
