//
//  MovieSummaryCell.swift
//  My-Spotlt
//
//  Created by Panda on 16/3/20.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class MovieSummaryCell: UITableViewCell {

    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var IbTitle: UILabel!
    @IBOutlet weak var IbDesctiption: UILabel!
    @IBOutlet weak var IbRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        IbRating.layer.cornerRadius = IbRating.frame.size.width / 2
        IbRating.layer.masksToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
