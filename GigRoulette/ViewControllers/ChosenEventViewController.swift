//
//  ChosenEventViewController.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ChosenEventViewController: UIViewController {
    
    var chosenEvent: EventEntity?
    var journey: Journey?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func imGoingButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let stepsVC = storyBoard.instantiateViewController(withIdentifier: "StepsVC") as! StepsVC
        stepsVC.journey = journey
        show(stepsVC, sender: self)
    }
    
    @IBAction func spinAgainButtonTapped(_ sender: Any) {
    }
}
