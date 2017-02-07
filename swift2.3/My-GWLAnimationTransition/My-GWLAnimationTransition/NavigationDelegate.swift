//
//  NavigationDelegate.swift
//  My-GWLAnimationTransition
//
//  Created by Panda on 16/3/20.
//  Copyright © 2016年 v2panda. All rights reserved.
//

import UIKit
// navigation全局的动画
class NavigationDelegate: NSObject ,UINavigationControllerDelegate{

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionAnimator()
    }
    
}
