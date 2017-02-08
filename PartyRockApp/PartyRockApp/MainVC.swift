//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Kris Rimar on 8/2/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellData = [CellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let video1 = CellData(imageURL: "https://i.ytimg.com/vi/XEEasR7hVhA/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/XEEasR7hVhA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Devil In I")
        
        let video2 = CellData(imageURL: "https://i.ytimg.com/vi/sgA7KIwKlOE/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vXgdYj3LvF0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Negative One")
        
        let video3 = CellData(imageURL: "https://upload.wikimedia.org/wikipedia/en/1/1b/Custer_cover.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qnZtGDFu3k0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Custer")
        
        let video4 = CellData(imageURL: "https://i.ytimg.com/vi/9LF7ScsZhoY/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CwAf9WNyXE8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "AOV")
        
        let video5 = CellData(imageURL: "https://i.ytimg.com/vi/XEEasR7hVhA/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/XEEasR7hVhA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Devil In I")
        
        cellData.append(video1)
        cellData.append(video2)
        cellData.append(video3)
        cellData.append(video4)
        cellData.append(video5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //asks the data source for a cell to insert into a particular location in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell {
            
            //each time we grab a new cell the table view knows which index we're on
            let tableCell = cellData[indexPath.row]
            
            cell.updateUI(cellData: tableCell)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
    //how many rows the table view will have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }

}

