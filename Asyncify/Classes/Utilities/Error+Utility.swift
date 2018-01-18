//
//  Error+Flatten.swift
//  Asyncify
//
//  Created by Jennifer Clark on 1/17/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import Foundation

extension Array where Iterator.Element == Error? {

    mutating func process() -> [Error?]  {
        let flat = flatMap { $0 }
        if flat.count == 0 {
            removeAll()
        }
        return self
    }
}

extension Array where Iterator.Element == [Error?] {

    mutating func process() -> [[Error?]]  {
        var i = 0
        while i < count {
            self[i] = self[i].process()
            i += 1
        }
        return self
    }
}
