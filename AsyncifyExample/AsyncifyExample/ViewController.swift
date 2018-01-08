//
//  ViewController.swift
//  AsyncifyExample
//
//  Created by Jennifer Clark on 1/7/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import UIKit
import Asyncify

enum AsyncExampleError: Error { case ExampleError }
typealias FunctionType<T> = (@escaping (T) -> Void, @escaping (Error?) -> Void) -> Void

class TaskGenerator {
    static func generateTask<T>(from function: @escaping FunctionType<T>) -> AATaskVoid<T> {
        return { success, failure in
            function({ value in
                success(value)
            }, { error in
                failure(error)
            })
        }
    }
}

class ViewController: UIViewController {

    private let queue = DispatchQueue(label: "Asyncify_example_queue", qos: .userInitiated)

    //1. Define a typealias to describe your function type:
    // <see definition at top of file>

    //2. Define your asynchronous functions:
    func exampleFunction1(success: @escaping (String) -> Void, failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(1), execute: {
            success("1")
        })
    }

    func exampleFunction2(success: @escaping (String) -> Void, failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(1), execute: {
            success("2")
        })
    }

    func exampleFunction3(success: @escaping (Bool) -> Void, failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(2), execute: {
            failure(AsyncExampleError.ExampleError)
        })
    }

    func exampleFunction4(success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(3), execute: {
            success(4)
        })
    }

    //3. Create a function to wrap your functions using one of the asyncify type functions:
    // <see task generator at top of file>

    //4. wrap your functions:
    let task1 = TaskGenerator.generateTask(from: { (success, failure) in
        ViewController.exampleFunction1(success: success, failure: failure)
    })

    let task2 = TaskGenerator.generateTask(from: { (success, failure) in
        ViewController.exampleFunction2(success: success, failure: failure)
    })

    let task3 = TaskGenerator.generateTask(from: { (success, failure) in
        ViewController.exampleFunction3(success: success, failure: failure)
    })

    let task4 = TaskGenerator.generateTask(from: { (success, failure) in
        ViewController.exampleFunction4(success: success, failure: failure)
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        //5. perform a zip, merge or collect depending on your combination of tasks:
        Asyncify.merge(task1, task2, task3, task4, completion: { results, error in
            displayResults(results.0, results.1, results.2, results.3, error)
        })
    }

    func displayResults(_ strVal1: String, _ strVal2: String, _ boolVal: Bool?, _ intVal: Int, _ errors: [Error]) {
        let result1Str = "Result for function 1 is: \(strVal1)."
        let result2Str = "Result for function 2 is: \(strVal2)."
        let result3Str = "Result for function 3 is: \(String(describing:boolVal)) because it failed, and the error we received was: \(errors[0])."
        let result4Str = "Result for function 4 is: \(intVal)."
        print("All functions have now completed: \(result1Str)/n\(result2Str)/n\(result3Str)/n\(result4Str)")
    }

}


