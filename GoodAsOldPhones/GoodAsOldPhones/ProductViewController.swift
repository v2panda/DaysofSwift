//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by v2panda on 2017/2/25.
//  Copyright © 2017年 Panda. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productNameLabel.text = product?.name
        
        if let imageName = product?.fullscreenImageName {
            productImageView.image = UIImage(named: imageName)
        }
    }

    @IBAction func addToCartPressed(_ sender: UIButton) {
        print("Hello World !");
    }
    
}
