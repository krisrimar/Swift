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
        
        let url = URL(string: cellData.imageURL)!
        
        
        //creates a new thread in the background that will try to download the image
        //so it doesn't freeze the thread
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                //when the image is done downloading it will put it into the cell
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //handle the error
            }
        }
    }

}
