//
//  FetchEventsViewController.swift
//  GigRoulette
//
//  Created by apple on 19/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class FetchEventsViewController: UIViewController {
    var currentLocation: CLLocation = CLLocation()
    var eventManager = EventsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let location = LocationTracker.sharedInstance.getCurrentLocation() {
            currentLocation = location
        }
    }
}
