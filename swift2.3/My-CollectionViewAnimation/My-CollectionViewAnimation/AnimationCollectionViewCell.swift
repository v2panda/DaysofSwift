//
//  AnimationCollectionViewCell.swift
//  My-CollectionViewAnimation
//
//  Created by Panda on 16/3/7.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    
    var backButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepareCell(viewModel:AnimationCellModel) {
        imageView.image = UIImage(named: viewModel.imagePath)
        textView.scrollEnabled = false
        button.hidden = true
        button.addTarget(self, action: Selector("backButtonDidTouch"), forControlEvents: .TouchUpInside)
    }
   
    func backButtonDidTouch() {
        backButtonTapped?()
    }
    
    func handleCellSelected() {
        textView.scrollEnabled = false
        button.hidden = false
        self.superview?.bringSubviewToFront(self)
    }
    
}
