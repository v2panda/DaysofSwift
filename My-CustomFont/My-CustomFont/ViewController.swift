//
//  ViewController.swift
//  My-CustomFont
//
//  Created by v2panda on 16/2/17.
//  Copyright © 2016年 Panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @大慈大悲大熊猫"]

    var fontNames = ["Gaspar Regular","MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var fontButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    @IBAction func changeFontDidTouched(sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 4
        tableView.reloadData()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        for family in UIFont.familyNames(){
            for font in UIFont.fontNamesForFamilyName(family){
                print(font)
            }
        }
        
        fontButton.layer.cornerRadius = 55
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyFontCell", forIndexPath: indexPath)
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

