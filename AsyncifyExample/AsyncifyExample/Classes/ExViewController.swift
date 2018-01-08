//
//  ExViewController.swift
//  AsyncifyExample
//
//  Created by Jennifer Clark on 1/7/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import UIKit
import Asyncify

enum AsyncExampleError: Error { case ExampleError }

class ExampleViewController: UIViewController {

    private let queue = DispatchQueue(label: "Asyncify_example_queue", qos: .userInitiated)

    lazy var displayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.frame = view.frame
        label.backgroundColor = .white
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.text = "Performing Requests..."
        return label
    }()


    //1. Define a typealias to describe your function type:
    // < See TaskGenerator.swift >

    //2. Define your asynchronous functions:
    func exampleFunction1(success: @escaping (String) -> Void, failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(3), execute: { [weak self] in
            self?.updateProcessingDisplay(1)
            success("1")
        })
    }

    func exampleFunction2(success: @escaping (String) -> Void, failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(1), execute: { [weak self] in
            self?.updateProcessingDisplay(2)
            success("2")
        })
    }

    func exampleFunction3(success: @escaping (Bool) -> Void, failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(2), execute: { [weak self] in
            self?.updateProcessingDisplay(3)
            failure(AsyncExampleError.ExampleError)
        })
    }

    func exampleFunction4(success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(4), execute: { [weak self] in
            self?.updateProcessingDisplay(4)
            success(4)
        })
    }

    //3. Create a function to wrap your functions using one of the asyncify type functions:
    // < See TaskGenerator.swift >

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(displayLabel)

        //4. wrap your functions:
        let task1 = TaskGenerator.generateTask(from: { [weak self] (success, failure) in
            self?.exampleFunction1(success: success, failure: failure)
        })

        let task2 = TaskGenerator.generateTask(from: { [weak self] (success, failure) in
            self?.exampleFunction2(success: success, failure: failure)
        })

        let task3 = TaskGenerator.generateTask(from: { [weak self] (success, failure) in
            self?.exampleFunction3(success: success, failure: failure)
        })

        let task4 = TaskGenerator.generateTask(from: { [weak self] (success, failure) in
            self?.exampleFunction4(success: success, failure: failure)
        })

        //5. perform a zip, merge or collect depending on your combination of tasks:
        Asyncify.merge(task1, task2, task3, task4, completion: { [weak self] results, error in
            self?.displayFinalResults(results.0, results.1, results.2, results.3, error)
        })
    }
}
