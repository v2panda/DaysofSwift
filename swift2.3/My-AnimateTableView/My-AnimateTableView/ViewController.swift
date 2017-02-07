//
//  ViewController.swift
//  My-AnimateTableView
//
//  Created by Panda on 16/2/26.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var firstTableView: UITableView!
    
    var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others" ]
    
    let cellIdentifier = "FirstTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        
        self.firstTableView.backgroundColor = UIColor.blackColor()
        self.firstTableView.separatorStyle = .None
        self.firstTableView.tableFooterView = UIView(frame: CGRectZero)
//        self.firstTableView.registerClass(FirstTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.firstTableView.dataSource = self
        self.firstTableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        animateTable()
    }
    
    func animateTable() {
        
        self.firstTableView.reloadData()
        
        let cells = self.firstTableView.visibleCells
        let tableHeight : CGFloat = self.firstTableView.bounds.height
        
        for i in cells {
            i.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                a.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
            index += 1
        }
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = .None
        return cell
    }
    
    func colorForIndex(index : Int) -> UIColor {
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

