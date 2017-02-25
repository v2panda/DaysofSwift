//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by v2panda on 2017/2/25.
//  Copyright © 2017年 Panda. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var products: [Product]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = [Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"),
                    Product(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"),
                    Product(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"),
                    Product(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4")]

    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let products = products {
            return products.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)

        cell.textLabel?.text = products?[indexPath.row].name

        if let imageName = products?[indexPath.row].cellImageName {
            cell.imageView?.image = UIImage(named: imageName)
        }
        
        return cell
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showProduct" {
            let productVC = segue.destination as? ProductViewController
            
            if let cell = sender as? UITableViewCell {
                if let IndexPath = tableView.indexPath(for: cell) {
                    productVC?.product = products?[IndexPath.row]
                }
            }
        }
    }
    

}
