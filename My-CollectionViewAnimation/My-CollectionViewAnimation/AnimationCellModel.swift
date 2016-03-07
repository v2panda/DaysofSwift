//
//  AnimationCellModel.swift
//  My-CollectionViewAnimation
//
//  Created by Panda on 16/3/7.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

//class AnimationCellModel: NSObject {
//
//}

struct AnimationCellModel {
    let imagePath: String
    
    init(imagePath:String?) {
        
        // 空值合并运算符
        self.imagePath = imagePath ?? ""
    }
}