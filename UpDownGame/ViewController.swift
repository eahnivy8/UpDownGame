//
//  ViewController.swift
//  UpDownGame
//
//  Created by Eddie Ahn on 30/08/2019.
//  Copyright © 2019 Eddie Ahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // properties
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var turnCountLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    
    var randomNumber: UInt32 = 0
    var turnCount: Int = 0
    
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        guard let inputText = self.inputField.text, inputText.isEmpty == false else {
            print("No Input Number")
            return
        }
        guard let inputNumber: UInt32 = UInt32(inputText) else {
            print("Wrong Input Number")
            return
        }
        turnCount += 1
        self.turnCountLabel.text = "\(turnCount)"
        if inputNumber > randomNumber {
            self.resultLabel.text = "UP!"
        } else if inputNumber < randomNumber {
            self.resultLabel.text = "DOWN!"
        } else {
            self.resultLabel.text = "Correct!"
        }
    }
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        self.initializeGame()
        }
    
    @IBAction func tapBackground(_ sender: UITapGestureRecognizer) {
        self.inputField.resignFirstResponder()
    }
    // Mark: Custom Methods
    func initializeGame() {
        
        self.randomNumber = arc4random() % 25
        self.turnCount = 0
        
        self.resultLabel.text = "Start!"
        self.turnCountLabel.text = "\(turnCount)"
        self.inputField.text = nil
        
        print("Random Number \(self.randomNumber)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeGame()
    }

}

