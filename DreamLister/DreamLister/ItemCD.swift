//
//  Item.swift
//  DreamLister
//
//  Created by Kris Rimar on 12/2/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    
    //called each time an item is created
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        //assign current date to the attribute
        self.created = NSDate()
    }
}
