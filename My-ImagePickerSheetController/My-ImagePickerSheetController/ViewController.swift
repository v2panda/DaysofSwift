//
//  ViewController.swift
//  My-ImagePickerSheetController
//
//  Created by Panda on 16/3/23.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var userProfileImageView: UIImageView!
    
    private var profileImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.width / 2
        userProfileImageView.layer.masksToBounds = true
    }

    
    @IBAction func imagetapped(sender: AnyObject) {
        
        let authorization = PHPhotoLibrary.authorizationStatus()
        
        if authorization == .NotDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) in
                dispatch_async(dispatch_get_main_queue(), { 
                    self.imagetapped(sender)
                })
            })
        }
        
        if authorization == .Authorized {
            let controller = ImagePickerSheetController()
            
            controller.addAction(ImageAction(title: NSLocalizedString("Take Photo or Video", comment: "Action Title"), secondaryTitle: NSLocalizedString("Use this one", comment: "Action Title"), style: .Default, handler: { (_) in
                self.presentCamera()
                }, secondaryHandler: { (action, numberOfPhotos) in
                    controller.getSelectedImagesWithCompletion({ (images) in
                        self.profileImage = images[0]
                        self.userProfileImageView.image = self.profileImage
                    })
            }))
         
            controller.addAction(ImageAction(title: NSLocalizedString("Cancel", comment: "Action Title"), style: .Cancel, handler: nil, secondaryHandler: nil))
            
            presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    
    func presentCamera() {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

