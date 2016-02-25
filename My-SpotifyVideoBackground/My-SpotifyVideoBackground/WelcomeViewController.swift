//
//  WelcomeViewController.swift
//  My-SpotifyVideoBackground
//
//  Created by Panda on 16/2/25.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    
    @IBOutlet weak var centerAlignPassword: NSLayoutConstraint!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func welcomeButtonDidTouched(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func loginButtonDidTouched(sender: AnyObject) {
        
        let bounds = self.loginButton.bounds
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .CurveLinear, animations: { () -> Void in
            
            self.loginButton.bounds = CGRect(x: bounds.origin.x-20, y: bounds.origin.y, width: bounds.width+60, height: bounds.size.height)
            
            }, completion: {(Void) -> Void in
                self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        })
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        centerAlignUsername.constant -= view.bounds.width
        centerAlignPassword.constant -= view.bounds.width
        loginButton.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            
            self.centerAlignUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.1, options: .CurveEaseOut, animations: { () -> Void in
            
            self.centerAlignPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveEaseOut, animations: { () -> Void in
            
            self.loginButton.alpha = 1
            
            }, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
