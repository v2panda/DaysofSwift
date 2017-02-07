//
//  VideoCell.swift
//  My-PlayLocalVideo
//
//  Created by v2panda on 16/2/18.
//  Copyright © 2016年 Panda. All rights reserved.
//

import UIKit

struct video {
    let image:String
    let title:String
    let source:String
}


class VideoCell: UITableViewCell {

    @IBOutlet weak var screenShot: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
