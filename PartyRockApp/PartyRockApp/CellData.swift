//
//  CellData.swift
//  PartyRockApp
//
//  Created by Kris Rimar on 8/2/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import Foundation

class CellData {
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    var imageURL: String {
        return _imageURL
    }
    
    var videoURL: String {
        return _videoURL
    }
    
    var videoTitle: String {
        return _videoTitle
    }
    
    init(imageURL: String, videoURL: String, videoTitle: String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
    
}
