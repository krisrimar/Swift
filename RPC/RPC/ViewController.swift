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
        updateUI("🤖")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rockBtnTapped(_ sender: Any) {
        play(.rock)
    }
    @IBAction func paperBtnTapped(_ sender: Any) {
        play(.paper)
    }
    @IBAction func scissorsBtnTapped(_ sender: Any) {
        play(.scissors)
    }
    @IBAction func playAgainBtnTapped(_ sender: Any) {
        currentGameState = .start
        updateUI("🤖")
    }
    
    
    func updateUI(_ newAppSign: String) {
        if(currentGameState == .start) {
            gameStatusLabel.text = currentGameState.result
            appSign.text = newAppSign
            playAgainBtn.isHidden = true
            
            rockSignBtn.isHidden = false
            paperSignBtn.isHidden = false
            scissorsSignBtn.isHidden = false
            
            rockSignBtn.isEnabled = true
            paperSignBtn.isEnabled = true
            scissorsSignBtn.isEnabled = true
        } else {
            gameStatusLabel.text = currentGameState.result
            appSign.text = newAppSign
            playAgainBtn.isHidden = false
            
            rockSignBtn.isHidden = true
            paperSignBtn.isHidden = true
            scissorsSignBtn.isHidden = true
            
            rockSignBtn.isEnabled = false
            paperSignBtn.isEnabled = false
            scissorsSignBtn.isEnabled = false
        }
    }
    
    func play(_ usersChoice: Sign) {
        let computersChoice = randomSign()
        currentGameState = gameResult(player1: usersChoice, player2: computersChoice)
        updateUI(computersChoice.emoji)
    }

}

