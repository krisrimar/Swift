//
//  MainVC.swift
//  DreamLister
//
//  Created by Kris Rimar on 12/2/17.
//  Copyright © 2017 Kris Rimar. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //generateTestData()
        attemptFetch()
        
    }
    
    //when we are creating a cell...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        //we are passing it into configureCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        
        return cell
    }
    
    //custom function for updating the cells
    func configureCell(cell: ItemCell, indexPath: NSIndexPath) {
        let item = controller.object(at: (indexPath as NSIndexPath) as IndexPath)
        cell.configureCell(item: item)
    }
    
    //when a selection of a table cell happens
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objs = controller.fetchedObjects , objs.count > 0 {
            let item = objs[indexPath.row]
            performSegue(withIdentifier: "ItemDetailsVC", sender: item)
        }
    }
    
    //get ready to pass any information form the original view to the new view 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetailsVC" {
            
            //create a variable for destination, set it to ItemDetails view controller
            if let destination = segue.destination as? ItemDetailsVC {
                
                //create an item and cast it as Item
                if let item = sender as? Item {
                    
                    //at the destination, assign itemToEdit a new value
                    destination.itemToEdit = item
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //if there are sections in the controller
        if let sections = controller.sections {
            
            //get the info out of it
            let sectionInfo = sections[section]
            
            //and return the number of objects
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    //controlls the height of the tableView cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    //CORE DATA:
    
    func attemptFetch() {
        
        //tell the variable what to go fetch
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        //how to sort the fetched data
        //the key is "created" which matches that in the data model for Item
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        
        //sortDescriptors requests an array, but now we only have one object, therefore we still use []
        fetchRequest.sortDescriptors = [dateSort]
        
        //NSManagedObjectContext is now passed the "context" constant which has been added to the AppDelegate
        //sectionNameKayPath: passing in nil because we need all of the results
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        //attempt a fetch with a controller
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
        
    }
    
    //whenever the table view is about to update this function will listen for changes and will handle it for you
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    }
    
    //will listen for when we will be making changes (insertion / deletion)
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
            
        case.insert:
            //when we create a new item, insert it into the table at a certain index
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
            
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
            
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
            
        }
    }
    
    //add items to CoreData (internal memory)
    //but if you don't run this function, the items will not show up
    //you need to save them to the memory first
    func generateTestData() {
        let item1 = Item(context: context)
        item1.title = "MacBook Pro"
        item1.price = 1800.0
        item1.details = "Fuck this is bullshit"
        
        let item2 = Item(context: context)
        item2.title = "Bose Headphones"
        item2.price = 300.0
        item2.details = "Fuck this is bullshit"
        
        let item3 = Item(context: context)
        item3.title = "Tesla Model S"
        item3.price = 111000.0
        item3.details = "I want to own this car"
        
        //add this to save to DB
        ad.saveContext()
    }
    
}

