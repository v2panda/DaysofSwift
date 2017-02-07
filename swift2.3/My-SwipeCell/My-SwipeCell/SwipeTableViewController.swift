//
//  SwipeTableViewController.swift
//  My-SwipeCell
//
//  Created by Panda on 16/3/8.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

struct pattern {
    let image: String
    let name: String
}

class SwipeTableViewController: UITableViewController {

    var data = [
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwipeCells", forIndexPath: indexPath) as! SwipeTableViewCell
        
        let pattern = data[indexPath.row]
        cell.swipeImageView.image = UIImage(named: pattern.image)
        cell.swipeLabel.text = pattern.name

        return cell
    }

    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .Normal, title: "🗑\nDelete") { (action, index) -> Void in
            print("Delete")
        }
        delete.backgroundColor = UIColor.redColor()
        
        let share = UITableViewRowAction(style: .Normal, title: "🤗\nShare") { (action, index) -> Void in
            
            let firstActivityItem = self.data[indexPath.row]
            
            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
        share.backgroundColor = UIColor.grayColor()
        
        let download = UITableViewRowAction(style: .Normal, title: "⬇️\nDownload") { (action, index) -> Void in
            print("Download")
        }
        download.backgroundColor = UIColor.greenColor()
        
        
        return [delete,share,download]
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
