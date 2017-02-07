//
//  ExploreViewController.swift
//  My-TabbarApp
//
//  Created by Panda on 16/3/10.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var exploreView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.exploreView.alpha = 0
        self.exploreView.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .CurveEaseIn, animations: { () -> Void in
            
            self.exploreView.transform = CGAffineTransformMakeScale(1, 1)
            self.exploreView.alpha = 1
            
            }, completion: nil )
        
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
