//
//  MainViewController.swift
//  My-TumblrMenu
//
//  Created by Panda on 16/3/3.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var chooseButton: UIButton!
    
    let userOne = UserInfoModel()
    let userTwo = UserInfoModel()
    
    var dataArray = [UserInfoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        
        self.mainTableView.dataSource = self
    }

    func initData() {
        userOne.headImage = "hugo"
        userOne.nameString = "v2panda"
        userOne.defaultImage = "1"
        
        userTwo.headImage = "mengto"
        userTwo.nameString = "Jim Xu"
        userTwo.defaultImage = "2"
        
        dataArray = [userOne,userTwo]
    }
    
    //MARK:  UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MainCells", forIndexPath: indexPath) as! MainTableViewCell
        cell.userInfo = dataArray[indexPath.row]
        
        return cell
    }
    
    @IBAction func unwindForSegue(unwindSegue: UIStoryboardSegue) {
        print("unwindForSegue")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
