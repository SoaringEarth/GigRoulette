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
    var eventManager = EventsViewModel()
    
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
        
        let rotationAnimation = CABasicAnimation()
        rotationAnimation.keyPath = "transform.rotation"
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = (2 * Float.pi)
        rotationAnimation.duration = 0.7
        rotationAnimation.repeatCount = 10
        rotationAnimation.isRemovedOnCompletion = true
        
        loadingImageView.layer.add(rotationAnimation, forKey: "rotate")
        CATransaction.commit()
    }
    
    private func presentFilterViewController() {
        performSegue(withIdentifier: "ToFiltersView", sender: nil)
    }
}
