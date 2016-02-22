//
//  InterestCollectionViewCell.swift
//  My-CarouselEffect
//
//  Created by Panda on 16/2/22.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    var interest : Interest! {
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    private func updateUI(){
        interestTitleLabel?.text = interest.title
        featuredImageView?.image! = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
