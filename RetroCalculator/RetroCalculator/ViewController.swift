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
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
    }

    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
    }

}

