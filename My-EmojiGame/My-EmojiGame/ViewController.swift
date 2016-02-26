//
//  ViewController.swift
//  My-EmojiGame
//
//  Created by Panda on 16/2/26.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var emojiPickerView: UIPickerView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    
    @IBAction func startButtonDidTouched(sender: AnyObject) {
        
        emojiPickerView.selectRow((Int)(arc4random() % 90 + 3), inComponent: 0, animated: true)
        emojiPickerView.selectRow((Int)(arc4random() % 90 + 3), inComponent: 1, animated: true)
        emojiPickerView.selectRow((Int)(arc4random() % 90 + 3), inComponent: 2, animated: true)
        
        if(dataArray1[emojiPickerView.selectedRowInComponent(0)] == dataArray2[emojiPickerView.selectedRowInComponent(1)]&&dataArray2[emojiPickerView.selectedRowInComponent(1)] == dataArray3[emojiPickerView.selectedRowInComponent(2)]) {
            resultLabel.text = "Bingo!"
        }else {
            resultLabel.text = "💔"
        }
        
        // startButton animate
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .CurveLinear, animations: { () -> Void in
            
            self.startButton.bounds = CGRect(x: self.startButton.bounds.origin.x, y: self.startButton.bounds.origin.y, width: self.startButton.bounds.size.width + 20, height: self.startButton.bounds.size.height)
            
            }) { (Bool) -> Void in
                
                UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
                    self.startButton.bounds = CGRect(x: self.startButton.bounds.origin.x, y: self.startButton.bounds.origin.y, width: self.startButton.bounds.size.width, height: self.startButton.bounds.size.height)
                    }, completion: nil)
                
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for(var i = 0; i < 100; i++) {
            dataArray1.append((Int)(arc4random() % 10))
            dataArray2.append((Int)(arc4random() % 10))
            dataArray3.append((Int)(arc4random() % 10))
        }
        
        resultLabel.text = ""
        
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.startButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            
            self.startButton.alpha = 1
            
            }, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = imageArray[(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(dataArray2[row])]
        } else if component == 2 {
            pickerLabel.text = imageArray[(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 88)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        return pickerLabel
    }


}

