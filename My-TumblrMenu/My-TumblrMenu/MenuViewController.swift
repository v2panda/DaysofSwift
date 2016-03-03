//
//  MenuViewController.swift
//  My-TumblrMenu
//
//  Created by Panda on 16/3/3.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuView: UIVisualEffectView!
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var charLabel: UILabel!
    @IBOutlet weak var audioButton: UIButton!
    @IBOutlet weak var audioLabel: UILabel!
    
    let transitionManager = MenuTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = self.transitionManager
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
