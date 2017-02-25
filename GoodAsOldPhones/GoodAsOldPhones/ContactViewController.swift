//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by v2panda on 2017/2/25.
//  Copyright © 2017年 Panda. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 800)
    }

}
