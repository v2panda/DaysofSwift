//
//  NewsTableViewController.swift
//  My-SlideMenu
//
//  Created by Panda on 16/3/2.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController ,TransitionManagerDelegate{

    let menuTransitionManager = TransitionManager()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
        self.title = "Everyday Moments"
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
        return 4
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as! NewsTableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        
        if indexPath.row == 0 {
            cell.postImageView.image = UIImage(named: "1")
            cell.titleLabel.text = "Love Mountain"
            cell.authorLabel.text = "Jim Xu"
            cell.headImageView.image = UIImage(named: "IMG_0483")
        } else if indexPath.row == 1 {
            cell.postImageView.image = UIImage(named: "2")
            cell.titleLabel.text = "The Swift"
            cell.authorLabel.text = "Tayor"
            cell.headImageView.image = UIImage(named: "IMG_0562")
        } else if indexPath.row == 2 {
            cell.postImageView.image = UIImage(named: "3")
            cell.titleLabel.text = "Summer"
            cell.authorLabel.text = "Peter"
            cell.headImageView.image = UIImage(named: "c")
        } else {
            cell.postImageView.image = UIImage(named: "4")
            cell.titleLabel.text = "Signal"
            cell.authorLabel.text = "Daniel"
            cell.headImageView.image = UIImage(named: "d")
        }
        
        return cell
    }

    @IBAction func unwindToNews(segue:UIStoryboardSegue) {
        let menuController = segue.sourceViewController as! MenuTableViewController
        self.title = menuController.currentItem
    }

    // MARK: TransitionManagerDelegate
    func transitionManagerDismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("233")
        
        let menuController = segue.destinationViewController as! MenuTableViewController
        menuController.currentItem = self.title!
        menuController.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
        

    }


}
