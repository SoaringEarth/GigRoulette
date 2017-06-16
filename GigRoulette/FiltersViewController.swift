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
	
	@IBOutlet weak var musicBTN: UIButton!
	@IBOutlet weak var sportsBTN: UIButton!
	@IBOutlet weak var comedyBTN: UIButton!
	@IBOutlet weak var artBTN: UIButton!
	@IBOutlet weak var familyBTN: UIButton!
	@IBOutlet weak var theatreBTN: UIButton!
	
	@IBOutlet weak var nowBTN: UIButton!
	@IBOutlet weak var tomorrowBTN: UIButton!
	@IBOutlet weak var anytimeBTN: UIButton!
	
	var locationManager:CLLocationManager!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		locationManager = CLLocationManager()
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestAlwaysAuthorization()
		locationManager.startUpdatingLocation()
		
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
		print("sender.tag = \(btn.tag)")
		
		switch btn.tag {
		case 1:
			if musicBTN.titleLabel?.text == "inactive" {
				musicBTN.setImage(UIImage(named:"Icon_selected_music"), for: .normal)
				musicBTN.setTitle("active", for: .normal)
			} else {
				musicBTN.setImage(UIImage(named:"Icon_unselected_music"), for: .normal)
				musicBTN.setTitle("inactive", for: .normal)
			}
			
		case 2:
			if sportsBTN.titleLabel?.text == "inactive" {
				sportsBTN.setImage(UIImage(named:"Icon_selected_Sport"), for: .normal)
				sportsBTN.setTitle("active", for: .normal)
			} else {
				sportsBTN.setImage(UIImage(named:"Icon_unselected_Sport"), for: .normal)
				sportsBTN.setTitle("inactive", for: .normal)
			}
		case 3:
			if theatreBTN.titleLabel?.text == "inactive" {
				theatreBTN.setImage(UIImage(named:"Icon_selected_Theatre"), for: .normal)
				theatreBTN.setTitle("active", for: .normal)
			} else {
				theatreBTN.setImage(UIImage(named:"Icon_unselected_Theatre"), for: .normal)
				theatreBTN.setTitle("inactive", for: .normal)
			}
		case 4:
			if artBTN.titleLabel?.text == "inactive" {
				artBTN.setImage(UIImage(named:"Icon_selected_Art"), for: .normal)
				artBTN.setTitle("active", for: .normal)
			} else {
				artBTN.setImage(UIImage(named:"Icon_unselected_Art"), for: .normal)
				artBTN.setTitle("inactive", for: .normal)
			}
		case 5:
			if comedyBTN.titleLabel?.text == "inactive" {
				comedyBTN.setImage(UIImage(named:"Icon_selected_Comedy"), for: .normal)
				comedyBTN.setTitle("active", for: .normal)
			} else {
				comedyBTN.setImage(UIImage(named:"Icon_unselected_Comedy"), for: .normal)
				comedyBTN.setTitle("inactive", for: .normal)
			}
		case 6:
			if familyBTN.titleLabel?.text == "inactive" {
				familyBTN.setImage(UIImage(named:"Icon_selected_Family"), for: .normal)
				familyBTN.setTitle("active", for: .normal)
			} else {
				familyBTN.setImage(UIImage(named:"Icon_unselected_Family"), for: .normal)
				familyBTN.setTitle("inactive", for: .normal)
			}
			
		case 7:
			if nowBTN.titleLabel?.text == "inactive" {
				nowBTN.setImage(UIImage(named:"Icon_selected_now"), for: .normal)
				nowBTN.setTitle("active", for: .normal)
			} else {
				nowBTN.setImage(UIImage(named:"Icon_unselected_now"), for: .normal)
				nowBTN.setTitle("inactive", for: .normal)
			}
			
		case 8:
			if tomorrowBTN.titleLabel?.text == "inactive" {
				tomorrowBTN.setImage(UIImage(named:"Icon_selected_tomorrow"), for: .normal)
				tomorrowBTN.setTitle("active", for: .normal)
			} else {
				tomorrowBTN.setImage(UIImage(named:"Icon_unselected_tomorrow"), for: .normal)
				tomorrowBTN.setTitle("inactive", for: .normal)
			}
		case 9:
			if anytimeBTN.titleLabel?.text == "inactive" {
				anytimeBTN.setImage(UIImage(named:"Icon_selected_anytime"), for: .normal)
				anytimeBTN.setTitle("active", for: .normal)
			} else {
				anytimeBTN.setImage(UIImage(named:"Icon_unselected_anytime"), for: .normal)
				anytimeBTN.setTitle("inactive", for: .normal)
			}
			
		default:
			break;
		}
		
	}
	
	func blurTheView(){
		let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = view.bounds
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		view.addSubview(blurEffectView)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FiltersViewController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		let locValue:CLLocationCoordinate2D = manager.location!.coordinate
		print("locations = \(locValue.latitude) \(locValue.longitude)")
	}
}
