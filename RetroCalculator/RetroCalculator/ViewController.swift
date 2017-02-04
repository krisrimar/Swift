//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Kris Rimar on 16/1/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var btnSound: AVAudioPlayer!
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //looking in the main resource files for the btn file
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        
        //now that we have a specific path we need to turn it into a URL to later use
        let soundURL = URL(fileURLWithPath: path!)
        
        //try creating a sound out of the URL
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        outputLbl.text = "0"
        
    }
    
    //this action is connected to every number button on the panel
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: UIButton) {
        processOperation(operation: Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: UIButton) {
        processOperation(operation: Operation.Multiply)
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
        processOperation(operation: Operation.Add)
    }
    
    @IBAction func onSubtractPressed(sender: UIButton) {
        processOperation(operation: Operation.Subtract)
    }
    
    @IBAction func onEqualPressed(sender: UIButton) {
        processOperation(operation: currentOperation)
    }

    //this function plays the sound
    func playSound() {
        
        //if sound is already playing - stop it, because otherwise it would repeat in new sound starting before the previous sound stopper
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
    func processOperation(operation: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * (Double(rightValStr))!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / (Double(rightValStr))!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + (Double(rightValStr))!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - (Double(rightValStr))!)"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
            
            currentOperation = operation
            
        } else {
            //In case the operator has been pressed for the first time
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

}

