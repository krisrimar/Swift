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
    
    let topChoices: [CaptionOption] = [CaptionOption(emoji: "🐶", caption: "I think that Kris is..."), CaptionOption(emoji: "🐰", caption: "I think that Kristina is..."), CaptionOption(emoji: "🦄", caption: "I think that Jaroslav is...")]
    
    let bottomChoices: [CaptionOption] = [CaptionOption(emoji: "🐙", caption: "en akkar"), CaptionOption(emoji: "📫", caption: "pochtoviy jashchik"), CaptionOption(emoji: "🌚", caption: "neponjatno shcho")]
    
    let images: [UIImage] = [UIImage(named: "Kris")!, UIImage(named: "Kristina")!, UIImage(named: "Jaroslav")!]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up the top segment control
        
        topCaptionSegmentControl.removeAllSegments()
        
        for choice in topChoices {
            topCaptionSegmentControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        
        topCaptionSegmentControl.selectedSegmentIndex = 0
        topCaptionLabel.text = topChoices[topCaptionSegmentControl.selectedSegmentIndex].caption
        
        //Set up the bottom segment control
        
        bottonCaptionSegmentControl.removeAllSegments()
        
        for choice in bottomChoices {
            bottonCaptionSegmentControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        
        bottonCaptionSegmentControl.selectedSegmentIndex = 0
        bottomCaptionLabel.text = bottomChoices[bottonCaptionSegmentControl.selectedSegmentIndex].caption
        
        //Set up image view
        imageView.image = images[topCaptionSegmentControl.selectedSegmentIndex]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func topSegmentControlTapped(_ sender: Any) {
        topCaptionLabel.text = topChoices[topCaptionSegmentControl.selectedSegmentIndex].caption
        imageView.image = images[topCaptionSegmentControl.selectedSegmentIndex]
    }
    
    @IBAction func bottomSegmentControlTapped(_ sender: Any) {
        bottomCaptionLabel.text = bottomChoices[bottonCaptionSegmentControl.selectedSegmentIndex].caption
    }
    
    

}

