//
//  ViewController.swift
//  My-TableAndColloectionView
//
//  Created by v2panda on 16/3/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var myTableView: UITableView!
    
    var modelArray = [TestModel]()
    var heightDictionary = [NSIndexPath:CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.estimatedRowHeight = 100
        
        for index in 1...20 {
            let model = TestModel()
            model.buttonCount = index
            modelArray.append(model)
        }
        
    }

    
    
    //MARK: - UITableViewDataSource&UITableViewDelegate
    private let kIdentifier = "TableCells"
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kIdentifier, forIndexPath: indexPath) as! TableViewCell
        
        heightDictionary[indexPath] = cell.bindWithData(modelArray[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        if let height = heightDictionary[indexPath] {
            return height
        }
        return 0
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

