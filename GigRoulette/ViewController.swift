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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLocationServices()
    }
    
    func startLocationServices() {
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
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
                getGeoHash(WithLat: 51.5076, AndLongitude: 0.1278, WithSuccess: { (geoHash) in
                    self.currentGeoHash = geoHash
                    getTMEvents(NearGeoHash: self.currentGeoHash, InRadius: 3, withDistanceUnit: .miles)
                })
//                getGeoHash(WithLat: currentLocation!.latitude, AndLongitude: currentLocation!.longitude, WithSuccess: { (geoHash) in
//                    self.currentGeoHash = geoHash
//                    getTMEvents(NearGeoHash: self.currentGeoHash, InRadius: "1.5", withDistanceUnit: .km)
//                })
            }
        }
    }
}



