//
//  MapViewController.swift
//  Citi
//
//  Created by Nadeem Mahmood on 10/4/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit
import GoogleMaps
import Foundation
import CoreLocation
import MapKit
import AWSDynamoDB

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var userRoleSwitch: UISwitch!
    @IBOutlet weak var userRoleText: UILabel!
    
    var userMarker: GMSMarker?
    var userView: UIImageView?
    
    var user: User?
    
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    
    @IBOutlet weak var tourGuideControlPaneView: TourGuideControlPaneView!
    
    func stateChanged() {
        if userRoleSwitch.isOn {
            userRoleText.text = "Tour Guide"
            user?.userType = "tour_guide"
            
            currentMode = ModeType.tour_guide
            self.tourGuideControlPaneView.isHidden = false
            UIView.animate(withDuration: 0.3, animations: {
                self.tourGuideControlPaneView.alpha = 0.9
            })
        } else {
            userRoleText.text = "Tourist"
            user?.userType = "tourist"
            
            currentMode = ModeType.tourist
            UIView.animate(withDuration: 0.3, animations: {
                self.tourGuideControlPaneView.alpha = 0
            }, completion: { (_) in
                self.tourGuideControlPaneView.isHidden = true
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if user?.userType == "tour_guide" {
            userRoleText.text = "Tour Guide"
        } else {
            userRoleText.text = "Tourist"
        }
            
        userRoleSwitch.addTarget(self, action: #selector(self.stateChanged), for: UIControlEvents.valueChanged)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        TourGuide.loadTourGuides()
        print("loading tour guides")

        
        /*let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 1)
         let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
         viewMap = mapView*/
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
//        let center = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        
        mapView.camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                                  longitude: userLocation!.coordinate.longitude, zoom: 15)
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        
        let userIcon = UIImage(named: "username_icon")!.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: userIcon)
        markerView.tintColor = UIColor.red
        self.userView = markerView
        
//        
//        let marker = GMSMarker(position: center)
//        marker.title = "Your Location"
//        marker.snippet = "\(center.latitude) \(center.longitude)"
//        //marker.iconView = markerView
//        marker.isFlat = true
//        marker.icon = UIImage(named: "username_icon")
//        marker.tracksViewChanges = true
//        marker.map = mapView
//        self.userMarker = marker
        
        findCloseDrivers();
        
//        locationManager.stopUpdatingLocation()
    }
    
    func mapView(_ mapView: GMSMapView, idleAtCameraPosition position: GMSCameraPosition) {
        UIView.animate(withDuration: 5.0, animations: { () -> Void in
            self.userView?.tintColor = UIColor.blue
            }, completion: {(finished: Bool) -> Void in
                // Stop tracking view changes to allow CPU to idle.
                self.userMarker?.tracksViewChanges = false
        })
    }
    
    var drawnTourGuides = false
    
    
    func findCloseDrivers() {
        if TourGuide.tourGuides.count == 0 {
            return
        }
      
        if drawnTourGuides {
            return
        }
        
        //  let tg = TourGuide()
        let tg = TourGuide.tourGuides
        
        print("NUMBER OF TOUR GUIDES: ", tg.count)
        
        for eachTourGuide: TourGuide in tg {
//            
            var tempLatitude: Double
            var tempLongitude: Double
            if let gps = eachTourGuide.gpsLocation {
                var xyString = gps.components(separatedBy: " ")
                tempLatitude = (xyString[0] as NSString).doubleValue
                tempLongitude = (xyString[1] as NSString).doubleValue
            } else {
                tempLatitude = 40.712784
                tempLongitude = -74.005941
            }
//            var xyString = eachTourGuide.gpsLocation?.components(separatedBy: " ")
//            print(eachTourGuide.gpsLocation)
            
//            let tempLatitude = 40.712784
//            let tempLongitude = -74.005941
            print("drawing a tour guide")
            print(String(format: "%f %f", tempLatitude, tempLongitude))

//            print("*****************$$#$###### temp Lat = /(tempLatitude)")
//            print("*****************$$#$###### temp Long = /(tempLongitude)")
            
            let position = CLLocationCoordinate2D(latitude: tempLatitude, longitude: tempLongitude)
            
            let marker = GMSMarker(position: position)
            marker.title = eachTourGuide.name ?? "Tour Guide"
          //  marker.snippet = "\(position.latitude) \(position.longitude)"
            //marker.iconView = markerView
            marker.snippet = "Contact: \(eachTourGuide.phoneNumber!) \n Hastags: Night life, Safari, Mountains"
            marker.isFlat = false
            marker.icon = UIImage(named: "tour_guide_small")
            marker.tracksViewChanges = true
            marker.map = mapView
            self.userMarker = marker
            
//            let marker = GMSMarker(position: position)
//            marker.icon = UIImage(named: "username_icon")
//            marker.isFlat = true
//            //marker.icon = UIImage(named: "username_icon")
//            marker.tracksViewChanges = true
//            marker.map = mapView
        }
        
        drawnTourGuides = true
        
        locationManager.stopUpdatingLocation()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

