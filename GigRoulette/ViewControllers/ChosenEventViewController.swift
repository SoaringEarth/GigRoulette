//
//  ChosenEventViewController.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ChosenEventViewController: UIViewController {
    @IBOutlet weak var chosenEventVenueTitleLabel: UILabel!
    @IBOutlet weak var chosenEventTitleLabel: UILabel!
    @IBOutlet weak var chosenEventVenueAddressLabel: UILabel!
    
    var chosenEvent: EventEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chosenEventTitleLabel.text = chosenEvent?.name
    }
    
    @IBAction func imGoingButtonTapped(_ sender: Any) {
        if let currentLocation = LocationTracker.sharedInstance.currentLocation {
            let latString = String(describing: currentLocation.coordinate.latitude)
            let lonString = String(describing: currentLocation.coordinate.longitude)
            let startPoint = Point(lat: latString, lon: lonString)
            getDirections(FromStartPoint: startPoint, ToEndPoint: chosenEvent!.eventLocation, WithSuccess: { (journey) in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let stepsVC = storyBoard.instantiateViewController(withIdentifier: "StepsVC") as! StepsVC
                stepsVC.journey = journey
                self.show(stepsVC, sender: self)
            })
        }
    }
    
    @IBAction func spinAgainButtonTapped(_ sender: Any) {
    }
}
