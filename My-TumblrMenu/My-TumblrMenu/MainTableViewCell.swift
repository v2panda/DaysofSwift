//
//  MainTableViewCell.swift
//  My-TumblrMenu
//
//  Created by Panda on 16/3/3.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var defaultImageView: UIImageView!
    
    var userInfo : UserInfoModel? {
        didSet {
            headImageView.image = UIImage(named: userInfo!.headImage!)
            nameLabel.text = userInfo!.nameString
            defaultImageView.image = UIImage(named: userInfo!.defaultImage!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
