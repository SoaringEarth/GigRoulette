//
//  FetchEventsViewController.swift
//  GigRoulette
//
//  Created by apple on 19/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import CoreLocation

class FetchEventsViewController: UIViewController {
    var currentLocation: CLLocation = CLLocation()
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var loadingImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let location = LocationTracker.sharedInstance.getCurrentLocation() {
            currentLocation = location
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveLinear, animations: {
                self.loadingImageView.alpha = 0.0
                // Change text to say "got events" or something
            }, completion: { (completed) in
                if completed {
                    self.presentFilterViewController()
                }
            })
        }
        
        let rotationAnimation = create(AnimationWithKeyPath: "transform.rotation",
                                       fromValue: 0.0,
                                       toValue: (2 * Float.pi),
                                       withDuration: 0.7,
                                       withRepeatCount: 10,
                                       andIsRemovedOnCompletion: true)
        
        loadingImageView.layer.add(rotationAnimation, forKey: "rotate")
        CATransaction.commit()
    }
    
    private func create(AnimationWithKeyPath keyPath: String, fromValue from: Any?, toValue to: Any?, withDuration duration: CFTimeInterval, withRepeatCount repeatCount: Float, andIsRemovedOnCompletion isRemoved: Bool) -> CABasicAnimation {
        let basicAnimation = CABasicAnimation()
        basicAnimation.keyPath = keyPath
        basicAnimation.fromValue = from
        basicAnimation.toValue = to
        basicAnimation.duration = duration
        basicAnimation.repeatCount = repeatCount
        basicAnimation.isRemovedOnCompletion = isRemoved
        return basicAnimation
    }
    
    private func presentFilterViewController() {
        performSegue(withIdentifier: "ToFiltersView", sender: nil)
    }
}
