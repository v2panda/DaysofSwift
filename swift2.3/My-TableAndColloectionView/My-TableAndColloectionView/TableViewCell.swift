//
//  TableViewCell.swift
//  My-TableAndColloectionView
//
//  Created by v2panda on 16/3/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

import UIKit

private let kLabelHeight:CGFloat = 24
private let kSpacing:CGFloat = 20

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstralnt: NSLayoutConstraint!
    var itemCount:Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindWithData(data : TestModel) -> CGFloat {
        itemCount = data.buttonCount
        myCollectionView.reloadData()
        collectionViewHeightConstralnt.constant = myCollectionView.collectionViewLayout.collectionViewContentSize().height
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
        
        return kLabelHeight + kSpacing + collectionViewHeightConstralnt.constant + 16
    }

}


//MARK: - 添加CollectionView
private let kCollectionIdentifier = "CollectionCells"
extension TableViewCell:UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number = itemCount {
            return number
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCollectionIdentifier, forIndexPath: indexPath)
        return cell
    }
    
    
}
