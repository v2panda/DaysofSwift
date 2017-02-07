//
//  TweetViewController.swift
//  My-TumblrMenu
//
//  Created by Panda on 16/3/4.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.delegate = self
        headImageView.layer.cornerRadius = headImageView.frame.width / 2
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITextViewDelegate
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        let myTextViewString = tweetTextView.text
        tweetCountLabel.text = "\(140 - myTextViewString.characters.count)"
        
        if range.length > 140 {
            return false
        }
        
        let newLength = (myTextViewString.characters.count) + range.length
        
        return newLength < 140
    }
    
    func keyBoardWillShow(note:NSNotification) {
        
        let userInfo = note.userInfo
        let keyBoardBounds = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltaY = keyBoardBounds.size.height
        let animations:(() -> Void) = {
            self.bottomView.transform = CGAffineTransformMakeTranslation(0, -deltaY)
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
            
            UIView.animateWithDuration(duration, delay: 0, options:options, animations: animations, completion: nil)
        }else {
            animations()
        }
        
    }
    
    func keyBoardWillHide(note:NSNotification) {
        
        let userInfo = note.userInfo
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let animations:(() -> Void) = {
            
            self.bottomView.transform = CGAffineTransformIdentity
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
            
            UIView.animateWithDuration(duration, delay: 0, options:options, animations: animations, completion: nil)
        } else {
            animations()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
