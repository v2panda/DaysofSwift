//
//  ViewController.swift
//  My-SnapchatMenu
//
//  Created by Panda on 16/2/19.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        
        let leftVC = LeftViewController(nibName: "LeftViewController", bundle: nil)
        let centerVC = CameraViewController(nibName: "CameraViewController", bundle: nil)
        let rightVC = RightViewController(nibName: "RightViewController", bundle: nil)
        
        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
//        leftVC.didMoveToParentViewController(self)
        
        self.addChildViewController(centerVC)
        self.scrollView.addSubview(centerVC.view)
        
        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        
        var centerViewFrame: CGRect = centerVC.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        centerVC.view.frame = centerViewFrame
        
        var rightViewFrame: CGRect = rightVC.view.frame
        rightViewFrame.origin.x = 2 * self.view.frame.width
        rightVC.view.frame = rightViewFrame
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

