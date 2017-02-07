//
//  ViewController.swift
//  My-GWLAnimationTransition
//
//  Created by Panda on 16/3/20.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pushBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindForSegue(unwindSegue: UIStoryboardSegue) {
        print("unwindForSegue")
    }

}

