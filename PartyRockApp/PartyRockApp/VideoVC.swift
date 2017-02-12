//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Kris Rimar on 8/2/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var videoLbl: UILabel!
    
    
    private var _videoObject: CellData!
    
    var cellData: CellData {
        get {
            return _videoObject
        } set {
            _videoObject = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoLbl.text = cellData.videoTitle
        webView.loadHTMLString(cellData.videoURL, baseURL: nil)

    }


}
