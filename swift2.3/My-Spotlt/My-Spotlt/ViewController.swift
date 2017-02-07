//
//  ViewController.swift
//  My-Spotlt
//
//  Created by Panda on 16/3/15.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblMovies: UITableView!
    var moviesinfo : NSMutableArray!
    var selectedMovieIndex : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movies"
        
        loadMoviesInfo()
        configureTableView()
        setupSearchableContent()
        
    }

    func loadMoviesInfo () {
        if let path = NSBundle.mainBundle().pathForResource("MoviesData", ofType: "plist") {
            moviesinfo = NSMutableArray(contentsOfFile: path)
        }
    }
    
    func configureTableView() {
        tblMovies.dataSource = self
        tblMovies.delegate = self
        tblMovies.tableFooterView = UIView(frame: CGRectZero)
        tblMovies.registerNib(UINib(nibName: "MovieSummaryCell", bundle: nil), forCellReuseIdentifier: "idCellMovieSummary")
    }
    
    // 设置Search核心代码
    func setupSearchableContent() {
        var searchableItems = [CSSearchableItem]()
        
        for i in 0...(moviesinfo.count - 1) {
            
            let movie = moviesinfo[i] as! [String: String]
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            
            // set the title
            searchableItemAttributeSet.title = movie["Title"]!
            
            // set the image
            let imagePathParts = movie["Image"]!.componentsSeparatedByString(".")
            searchableItemAttributeSet.thumbnailURL = NSBundle.mainBundle().URLForResource(imagePathParts[0], withExtension: imagePathParts[1])
            
            // set the description
            searchableItemAttributeSet.contentDescription = movie["Description"]!
            
            var keywords = [String]()
            let movieCategories = movie["Category"]!.componentsSeparatedByString(", ")
            for movieCategory in movieCategories {
                keywords.append(movieCategory)
            }
            
            let stars = movie["Stars"]!.componentsSeparatedByString(", ")
            for star in stars {
                keywords.append(star)
            }
            
            searchableItemAttributeSet.keywords = keywords
            
            let searchableItem = CSSearchableItem(uniqueIdentifier: "PDA.My-Spotlt.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            searchableItems.append(searchableItem)
            
            CSSearchableIndex.defaultSearchableIndex().indexSearchableItems(searchableItems) { (error) -> Void in
                if error != nil {
                    print(error?.localizedDescription)
                }
            }
        }
        
    }
    
    override func restoreUserActivityState(activity: NSUserActivity) {
        
        if activity.activityType == CSSearchableItemActionType {
            if let userInfo = activity.userInfo {
                let selectedMovie = userInfo[CSSearchableItemActivityIdentifier] as! String
                selectedMovieIndex = Int(selectedMovie.componentsSeparatedByString(".").last!)
                performSegueWithIdentifier("idSegueShowMovieDetails", sender: self)
            }
        }
    }
    
    
    
   //MARK - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moviesinfo != nil {
            return moviesinfo.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCellMovieSummary", forIndexPath: indexPath) as! MovieSummaryCell
        
        let currentMovieInfo = moviesinfo[indexPath.row] as! [String : String]
        
        cell.IbTitle.text = currentMovieInfo["Title"]!
        cell.IbDesctiption.text = currentMovieInfo["Description"]!
        cell.IbRating.text = currentMovieInfo["Rating"]!
        cell.imgMovieImage.image = UIImage(named: currentMovieInfo["Image"]!)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    //MARK - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedMovieIndex = indexPath.row
        performSegueWithIdentifier("idSegueShowMovieDetails", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "idSegueShowMovieDetails" {
                let movieDetailsViewController = segue.destinationViewController as! DetailViewController
                movieDetailsViewController.movieInfo = moviesinfo[selectedMovieIndex] as! [String:String]
            }
        }
    }

}

