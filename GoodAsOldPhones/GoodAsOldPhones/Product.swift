//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by v2panda on 2017/2/25.
//  Copyright © 2017年 Panda. All rights reserved.
//

import UIKit

class Product {
    var name: String?
    var cellImageName: String?
    var fullscreenImageName: String?
    
    init(name:String, cellImageName: String, fullscreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullscreenImageName
    }

}
