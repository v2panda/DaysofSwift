//
//  DetailViewController.swift
//  My-Spotlt
//
//  Created by Panda on 16/3/20.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var IblTitle: UILabel!
    @IBOutlet weak var IbCategory: UILabel!
    @IBOutlet weak var IbDesctiption: UILabel!
    @IBOutlet weak var IbDirector: UILabel!
    @IBOutlet weak var IbStars: UILabel!
    @IBOutlet weak var IbRating: UILabel!
    
    var movieInfo: [String: String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        IbRating.layer.cornerRadius = IbRating.frame.size.width / 2
        IbRating.layer.masksToBounds = true
        
        if movieInfo != nil {
            populateMovieInfo()
        }
    }
    
    func populateMovieInfo() {

        IblTitle.text = movieInfo["Title"]!
        IbCategory.text = movieInfo["Category"]!
        IbDesctiption.text = movieInfo["Description"]!
        IbDirector.text = movieInfo["Director"]!
        IbStars.text = movieInfo["Stars"]!
        IbRating.text = movieInfo["Rating"]!
        imgMovieImage.image = UIImage(named: movieInfo["Image"]!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
