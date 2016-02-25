//
//  ViewController.swift
//  My-SpotifyVideoBackground
//
//  Created by Panda on 16/2/25.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
    }
    
    func setupVideoBackground() {
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

