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
        chosenEventVenueTitleLabel.text = chosenEvent?.eventVenue.name
        chosenEventVenueAddressLabel.text = chosenEvent?.eventVenue.addressLine1
    }
    
    @IBAction func imGoingButtonTapped(_ sender: Any) {
        imGoing()
    }
    
    private func imGoing() {
        let alertViewController = UIAlertController(title: "Purchase Ticket?", message: "This will lead to the purchasing flow when implemented.", preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertViewController, animated: true, completion: nil)
        
//        if let currentLocation = LocationTracker.sharedInstance.currentLocation {
//            let latString = String(describing: currentLocation.coordinate.latitude)
//            let lonString = String(describing: currentLocation.coordinate.longitude)
//            let startPoint = Point(lat: latString, lon: lonString)
//            getDirections(FromStartPoint: startPoint, ToEndPoint: chosenEvent!.eventLocation, WithSuccess: { (journey) in
//                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                let stepsVC = storyBoard.instantiateViewController(withIdentifier: "StepsVC") as! StepsVC
//                stepsVC.journey = journey
//                self.navigationController?.navigationBar.isHidden = false
//                self.navigationController?.pushViewController(stepsVC, animated: true)
//            })
//        }
    }
    
    @IBAction func spinAgainButtonTapped(_ sender: Any) {
        spinAgain()
    }
    
    private func spinAgain() {
        navigationController?.popToRootViewController(animated: true)
    }
}
