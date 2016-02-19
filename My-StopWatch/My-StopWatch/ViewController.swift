//
//  ViewController.swift
//  My-StopWatch
//
//  Created by v2panda on 16/2/16.
//  Copyright © 2016年 Panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 声明变量
    var Counter : Double = 0
    var Timer : NSTimer = NSTimer()
    var IsPlaying : Bool = false
    // 重写父类方法 -- 状态栏设为白色
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    //
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(Counter)
    }
    
    @IBAction func resetButtonDidTouch(sender: AnyObject) {
        Timer.invalidate()
        IsPlaying = false
        Counter = 0
        timeLabel.text = String(Counter)
    }
    
    @IBAction func playButtonDidTouch(sender: AnyObject) {
        if(IsPlaying){
            return
        }
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("UpdateTimer"), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(sender: AnyObject) {
        IsPlaying = false
        Timer.invalidate()
    }
    
    
    func UpdateTimer() {
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }


}

