//
//  TableCell.swift
//  PartyRockApp
//
//  Created by Kris Rimar on 8/2/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //pass data into this function each time a new cell is created
    //we need this function because each time new cells appear on the screen iOS does not add them
    //it recycles them: meaning just changes the content
    func updateUI(cellData: CellData) {
        videoTitle.text = cellData.videoTitle
        //TODO: set image from URL
    }

}
