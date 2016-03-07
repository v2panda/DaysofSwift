//
//  AnimationImageCollection.swift
//  My-CollectionViewAnimation
//
//  Created by Panda on 16/3/7.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit
//class AnimationImageCollection: NSObject {
//
//}

struct AnimationImageCollection {
    private let imagePaths = ["1", "2", "3", "4", "5"]
    var images: [AnimationCellModel]
    
    init() {
        images = imagePaths.map {AnimationCellModel(imagePath: $0)}
    }
    
}