//
//  ViewController.swift
//  GigRoulette
//
//  Created by apple on 15/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D? = nil
    var currentGeoHash: String = ""
    
    var eventManager: EventsManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLocationServices()
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

extension ViewController: CLLocationManagerDelegate {
    
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



