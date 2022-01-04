//
//  View1+Actions.swift
//  Calculator-SwiftUI
//
//  Created by Ibrahim Hassan on 04/01/22.
//

import SwiftUI

// --------------------------------------------------------------------------------
// View1 - Actions
// --------------------------------------------------------------------------------
extension View1 {
    func reset() {
        //TODO: Paste the contents of ViewController.reset()
        brain = CalculatorBrain()
        display = String(0).beautifyNumbers()
        descriptionDisplay = " "
        userIsInTheMiddleOfTyping = false
        variables = Dictionary<String,Double>()
    }
    
    func undo() {
        //TODO: Paste the contents of ViewController.undo()
        if userIsInTheMiddleOfTyping {
            display.remove(at: display.index(before: display.endIndex))
            if display.isEmpty || "0" == display {
                display = "0"
                userIsInTheMiddleOfTyping = false
            }
        } else {
            brain.undo()
            displayResult()
        }
    }
    
    private func displayResult() {
        let evaluated = brain.evaluate(using: variables)
        
        if let error = evaluated.error {
            display = error
        } else if let result = evaluated.result {
            display = String(result).beautifyNumbers()
        }
        
        if "" != evaluated.description {
            descriptionDisplay = evaluated.description.beautifyNumbers() + (evaluated.isPending ? "…" : "=")
        } else {
            descriptionDisplay = " "
        }
    }
    
    func storeToMemory() {
        //TODO: Paste the contents of ViewController.storeToMemory()
        variables["M"] = displayValue
        userIsInTheMiddleOfTyping = false
        displayResult()
    }
    
    func callMemory() {
        //TODO: Paste the contents of ViewController.callMemory()
        brain.setOperand(variable: "M")
        userIsInTheMiddleOfTyping = false
        displayResult()
    }
    
    func performOperation(_ mathematicalSymbol: String) {
        //TODO: Paste the contents of ViewController.performOperation()
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        brain.performOperation(mathematicalSymbol)
        displayResult()
    }
    
    func touchDigit(_ digit: String) {
        //TODO: Paste the contents of ViewController.touchDigit()
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display
            if decimalSeparator != digit || !textCurrentlyInDisplay.contains(decimalSeparator) {
                display = textCurrentlyInDisplay + digit
            }
        } else {
            switch digit {
            case decimalSeparator:
                display = "0" + decimalSeparator
            case "0":
                if "0" == display {
                    return
                }
                fallthrough
            default:
                display = digit
            }
            userIsInTheMiddleOfTyping = true
        }

    }
}
