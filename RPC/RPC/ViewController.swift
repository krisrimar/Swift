//
//  ViewController.swift
//  RPC
//
//  Created by Kris Rimar on 24/1/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentGameState = GameState.start

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockSignBtn: UIButton!
    @IBOutlet weak var paperSignBtn: UIButton!
    @IBOutlet weak var scissorsSignBtn: UIButton!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rockBtnTapped(_ sender: Any) {
        updateUI()
    }
    @IBAction func paperBtnTapped(_ sender: Any) {
        updateUI()
    }
    @IBAction func scissorsBtnTapped(_ sender: Any) {
        updateUI()
    }
    @IBAction func playAgainBtnTapped(_ sender: Any) {
        updateUI()
    }
    
    
    func updateUI() {
        if(currentGameState == .start) {
            gameStatusLabel.text = currentGameState.result
            appSign.text = "🤖"
            playAgainBtn.isHidden = true
            
            rockSignBtn.isHidden = false
            paperSignBtn.isHidden = false
            scissorsSignBtn.isHidden = false
            
            rockSignBtn.isEnabled = true
            paperSignBtn.isEnabled = true
            scissorsSignBtn.isEnabled = true
        }
    }

}

