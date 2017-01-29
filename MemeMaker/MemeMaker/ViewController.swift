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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

