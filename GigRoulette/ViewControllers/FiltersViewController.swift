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

	@IBOutlet weak var userlocationLabel: UILabel!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation = CLLocation()
    var currentGeoHash: String = ""
    
    var eventManager: EventsManager?
	
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
            getCountryCode(FromLocation: currentLocation, withSuccess: { (countryCode) in
                getGeoHash(ForLocation: self.currentLocation, WithSuccess: { (geoHash) in
                    self.currentGeoHash = geoHash
                    self.eventManager = EventsManager(WithGeoHash: geoHash, AndCountryCode: countryCode)
                })
            })
        }
        
        getDirections(FromStartPoint: Point(lat: "51.5412969", lon: "-0.0954148"), ToEndPoint: Point(lat: "51.5388457", lon: "-0.1367267"))
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
        if eventManager?.events != nil {
            let loadingVC = LoadingVC(nibName: "LoadingVC", bundle: nil)
            loadingVC.chosenEvent = eventManager!.events!.first
            show(loadingVC, sender: self)
        }
	}
}
