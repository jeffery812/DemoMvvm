//
//  TableViewController.swift
//  DemoMvvm
//
//  Created by Zhihui Tang on 2016-10-12.
//  Copyright © 2016 Zhihui Tang. All rights reserved.
//

import UIKit

// http://candycode.io/a-practical-mvvm-example-in-swift-part-1/


class TableViewController: UITableViewController {
    let cars: [CarViewModel] = (UIApplication.sharedApplication().delegate as! AppDelegate).cars
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CarCell", forIndexPath: indexPath)
        let carViewModel = cars[indexPath.row]
        
        cell.textLabel?.text = carViewModel.titleText
        cell.detailTextLabel?.text = carViewModel.horsepowerText
        loadImage(cell, photoURL: carViewModel.photoURL)
        
        return cell
    }
    
    func loadImage(cell: UITableViewCell, photoURL: NSURL?) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            guard let imageURL = photoURL, imageData = NSData(contentsOfURL: imageURL) else {
                return
            }
            dispatch_async(dispatch_get_main_queue()) {
                cell.imageView?.image = UIImage(data: imageData)
                cell.setNeedsLayout()
            }
        }
    }
}
