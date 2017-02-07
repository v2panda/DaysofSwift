//
//  ViewController.swift
//  My-CarouselEffect
//
//  Created by Panda on 16/2/22.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ceCollection: UICollectionView!
    
    private var interests = Interest.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    private struct Storyboard{
        static let CellIdentifier = "InterestCell"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UICollectionViewDataSource{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! InterestCollectionViewCell
        
        cell.interest = self.interests[indexPath.row]
        
        return cell
    }
    
}