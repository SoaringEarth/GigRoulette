//
//  FiltersViewController.swift
//  GigRoulette
//
//  Created by Emal SAIFI on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import CoreLocation

class FiltersViewController: UIViewController {

    var currentLocation: CLLocation = CLLocation()
    var currentGeoHash: String = ""
    var eventManager = EventsViewModel()
    
    @IBOutlet weak var userlocationLabel: UILabel!
    
	@IBOutlet weak var musicBTN: UIButton!
	@IBOutlet weak var sportsBTN: UIButton!
	@IBOutlet weak var comedyBTN: UIButton!
	@IBOutlet weak var artBTN: UIButton!
	@IBOutlet weak var familyBTN: UIButton!
	@IBOutlet weak var theatreBTN: UIButton!
	
	@IBOutlet weak var nowBTN: UIButton!
	@IBOutlet weak var tomorrowBTN: UIButton!
	@IBOutlet weak var anytimeBTN: UIButton!
    
    
	override func viewDidLoad() {
        super.viewDidLoad()
                
        if let location = LocationTracker.sharedInstance.getCurrentLocation() {
            currentLocation = location
        }
        
		musicBTN.setTitle("inactive", for: .normal)
		sportsBTN.setTitle("inactive", for: .normal)
		comedyBTN.setTitle("inactive", for: .normal)
		artBTN.setTitle("inactive", for: .normal)
		familyBTN.setTitle("inactive", for: .normal)
		theatreBTN.setTitle("inactive", for: .normal)
		
		nowBTN.setTitle("inactive", for: .normal)
		tomorrowBTN.setTitle("inactive", for: .normal)
		anytimeBTN.setTitle("inactive", for: .normal)
        
    }
	
	@IBAction func genreButtonAction(_ sender: Any) {
		let btn:UIButton = sender as! UIButton
        btn.isSelected = !btn.isSelected
	}
    
	@IBAction func partyAction(_ sender: Any) {
        if eventManager.getEvents().count > 0 {
            let loadingVC = LoadingVC(nibName: "LoadingVC", bundle: nil)
            loadingVC.chosenEvent = eventManager.getEvents().first
            self.show(loadingVC, sender: self)
        }
	}
}
