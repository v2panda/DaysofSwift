//
//  ViewController.swift
//  My-PullToRefresh
//
//  Created by Panda on 16/2/23.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource{
    
    let cellIdentifier = "NewCellIdentifier"
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    var tableViewController = UITableViewController(style: .Plain)
    
    var refreshControl = UIRefreshControl()
    var navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 375, height: 64))
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        emojiData = favoriteEmoji
        let emojiTableView = tableViewController.tableView
        
        emojiTableView.backgroundColor = UIColor(red: 0.092, green: 0.096, blue: 0.116, alpha: 1)
        emojiTableView.dataSource = self
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        tableViewController.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: "didRoadEmoji", forControlEvents: .ValueChanged)
        
        self.refreshControl.backgroundColor = UIColor(red: 0.113, green: 0.113, blue: 0.145, alpha: 1)
        let attributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.refreshControl.attributedTitle = NSAttributedString(string: "上次刷新时间 \(NSDate())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.whiteColor()
        
        self.title = "emoji"
        self.navBar.barStyle = .BlackTranslucent
        
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        emojiTableView.tableFooterView = UIView(frame: CGRectZero)
        emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.view.addSubview(emojiTableView)
        self.view.addSubview(navBar)
    }

    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)! as UITableViewCell
        
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.Center
        cell.textLabel!.font = UIFont.systemFontOfSize(50)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    func didRoadEmoji(){
        self.emojiData = newFavoriteEmoji
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }


}

