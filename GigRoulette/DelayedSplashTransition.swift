//
//  DelayedSplashTransition.swift
//  GigRoulette
//
//  Created by apple on 19/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class DelayedSplashTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromVC = transitionContext.viewController(
            forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(
            forKey: UITransitionContextViewControllerKey.to)
        
        containerView.addSubview(toVC!.view)
        toVC!.view.alpha = 0.0
        
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromVC?.view.alpha = 0.0
            toVC!.view.alpha = 1.0
        }, completion: { finished in
            let cancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!cancelled)
        })
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
}
