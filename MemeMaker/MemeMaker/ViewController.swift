//
//  ViewController.swift
//  MemeMaker
//
//  Created by Kris Rimar on 29/1/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topCaptionSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    
    @IBOutlet weak var bottonCaptionSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    let topChoices: [CaptionOption] = [CaptionOption(emoji: "A", caption: "A"), CaptionOption(emoji: "B", caption: "A"), CaptionOption(emoji: "C", caption: "C")]
    
    let bottomChoices: [CaptionOption] = [CaptionOption(emoji: "A", caption: "A"), CaptionOption(emoji: "B", caption: "A"), CaptionOption(emoji: "C", caption: "C")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up the top segment control
        
        topCaptionSegmentControl.removeAllSegments()
        
        for choice in topChoices {
            topCaptionSegmentControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        
        topCaptionSegmentControl.selectedSegmentIndex = 0
        
        //Set up the bottom segment control
        
        bottonCaptionSegmentControl.removeAllSegments()
        
        for choice in bottomChoices {
            bottonCaptionSegmentControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        
        bottonCaptionSegmentControl.selectedSegmentIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

