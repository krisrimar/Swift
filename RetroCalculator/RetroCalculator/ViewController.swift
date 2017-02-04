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
        
    }
    
    //this action is connected to every button on the panel
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }

    //this function plays the sound
    func playSound() {
        
        //if sound is already playing - stop it, because otherwise it would repeat in new sound starting before the previous sound stopper
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
    }

}

