//
//  CaptionChoice.swift
//  MemeMaker
//
//  Created by Kris Rimar on 29/1/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import Foundation

struct CaptionOption {
    var emoji: String
    var caption: String
    
    init(emoji: String, caption: String) {
        self.emoji = emoji
        self.caption = caption
    }
}
