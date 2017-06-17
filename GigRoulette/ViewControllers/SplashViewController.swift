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
        
        if LocationTracker.sharedInstance.currentStatus == .denied {
            presentLocationSettingsAlert()
        }
        
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
    
    private func presentLocationSettingsAlert() {
        let alertController = UIAlertController(
            title: "Background Location Access Disabled",
            message: "In order to be notified about adorable kittens near you, please open this app's settings and set location access to 'Always'.",
            preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: { _ in })
            }
        }
        alertController.addAction(openAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
