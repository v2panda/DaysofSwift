//
//  ThirdViewController.swift
//  My-SlideOutMenu
//
//  Created by Panda on 16/3/9.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }


}
