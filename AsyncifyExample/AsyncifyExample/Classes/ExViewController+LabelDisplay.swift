//
//  ExampleViewController+LabelDisplay.swift
//  AsyncifyExample
//
//  Created by Jennifer Clark on 1/7/18.
//  Copyright © 2018 Jennifer Clark. All rights reserved.
//

import UIKit

extension ExampleViewController {

    func updateProcessingDisplay(_ fNum: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.displayLabel.text = (self?.displayLabel.text ?? "") + "\n\nExample Function \(fNum) has completed."
        }
    }

    func displayFinalResults(_ strVal1: String?, _ strVal2: String?, _ boolVal: Bool?, _ intVal: Int?, _ errors: [Error?]) {
        let result1Str = "Result for function 1 is \(String(describing:strVal1))."
        let result2Str = "Result for function 2 is \(String(describing:strVal2))."
        let result3Str = "Result for function 3 is \(String(describing:boolVal)) because it failed, and the error we received was: \(String(describing: errors[0]))."
        let result4Str = "Result for function 4 is \(String(describing:intVal))."
        displayLabel.text = "All functions have now completed: \n\n \(result1Str) \n\n \(result2Str) \n\n \(result3Str) \n\n \(result4Str)"
    }
}
