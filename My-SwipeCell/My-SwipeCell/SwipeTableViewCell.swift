//
//  SwipeTableViewCell.swift
//  My-SwipeCell
//
//  Created by Panda on 16/3/8.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class SwipeTableViewCell: UITableViewCell {

    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var swipeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
