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
    var currentLocation: CLLocationCoordinate2D? = nil
    var currentGeoHash: String = ""
    
    var eventManager: EventsManager?
    
	override func viewDidLoad() {
        super.viewDidLoad()
        startLocationServices()
		
		//blurTheView()
        
        getDirections(FromStartPoint: Point(lat: "51.5412969", lon: "-0.0954148"), ToEndPoint: Point(lat: "51.5388457", lon: "-0.1367267"))
    }
	
	@IBAction func genreButtonAction(_ sender: Any) {
		
		let btn:UIButton = sender as! UIButton
		print("sender.tag = \(btn.tag)")
	}
	
	func blurTheView(){
		let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = view.bounds
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		view.addSubview(blurEffectView)
        
    }
        
    func startLocationServices() {
        
        // Ask for Authorisation from the User.
        locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
}

extension FiltersViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if currentLocation == nil {
            if let locationCoordinates = manager.location?.coordinate {
                currentLocation = locationCoordinates
                getPlacemarkFromLocation(location: manager.location!, withSuccess: { (countryCode) in
                    getGeoHash(WithLat: self.currentLocation!.latitude, AndLongitude: self.currentLocation!.longitude, WithSuccess: { (geoHash) in
                        self.currentGeoHash = geoHash
                        self.eventManager = EventsManager(WithGeoHash: geoHash, AndCountryCode: countryCode)
                    })
                })
            }
        }
    }
    
    func getPlacemarkFromLocation(location: CLLocation, withSuccess success: @escaping (String)->()) {
        CLGeocoder().reverseGeocodeLocation(location, completionHandler:
            { (placemarks, error) in
                if let placeMark = placemarks?.first {
                    if let countryCode = placeMark.isoCountryCode {
                        success(countryCode)
                    }
                }
        })
    }
}
