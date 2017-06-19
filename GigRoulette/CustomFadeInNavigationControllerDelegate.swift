//
//  CustomFadeInNavigationControllerDelegate.swift
//  GigRoulette
//
//  Created by apple on 19/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class CustomFadeInNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if fromVC is FetchEventsViewController {
            return CustomFadeInTransition()
        } else if fromVC is SplashViewController {
            return DelayedSplashTransition()
        }else {
            return nil
        }        
    }
}
