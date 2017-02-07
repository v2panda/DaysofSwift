//
//  MenuTableViewController.swift
//  My-SlideMenu
//
//  Created by Panda on 16/3/2.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menuItems = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    var currentItem = "Everyday Moments"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.backgroundColor = UIColor(red:0.109, green:0.114, blue:0.128, alpha:1)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCells", forIndexPath: indexPath) as! MenuTableViewCell

        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor.whiteColor() : UIColor.grayColor()
        cell.backgroundColor = UIColor.clearColor()

        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("menu")
        
        let menuTableViewController = segue.sourceViewController as! MenuTableViewController
        
        if let selectedRow = menuTableViewController.tableView.indexPathForSelectedRow?.row {
            currentItem = menuItems[selectedRow]
        }
    }


}
