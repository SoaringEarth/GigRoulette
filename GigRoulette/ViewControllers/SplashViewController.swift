//
//  SplashViewController.swift
//  GigRoulette
//
//  Created by Emal SAIFI on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import CoreLocation

class SplashViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        while LocationTracker.sharedInstance.currentStatus != .authorizedWhenInUse {
            // Wait for locationTracker's status to change
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FiltersViewController") as? FiltersViewController {
                if let navigator = self.navigationController {
                    navigator.pushViewController(viewController, animated: false)
                }
            }
        })
    }
}
