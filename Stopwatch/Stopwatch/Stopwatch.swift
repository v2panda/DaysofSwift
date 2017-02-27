//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by v2panda on 2017/2/27.
//  Copyright © 2017年 Panda. All rights reserved.
//

import UIKit

class Stopwatch: NSObject {
    var counter: Double
    var timer: Timer
    
    override init() {
        self.counter = 0.0
        self.timer = Timer()
    }
    
    
}
