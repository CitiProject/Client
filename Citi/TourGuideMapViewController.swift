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

class TourGuideMapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var userRoleSwitch: UISwitch!
    @IBOutlet weak var userRoleText: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var addressSearch: UISearchBar!
    
    var userMarker: GMSMarker?
    var userView: UIImageView?
    
    var user: User?
    var user2:Requests?
    
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    
    var timer: DispatchSourceTimer?
    
    func startTimer() {
        let queue = DispatchQueue(label: "com.domain.app.timer")  // you can also use `DispatchQueue.main`, if you want
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer!.scheduleRepeating(deadline: .now(), interval: .seconds(60))
        
        timer!.setEventHandler { [weak self] in
            // do whatever you want here
            self?.user2?.checkRequest(hash: (self?.user?.email)!).continue(successBlock: { (task: AWSTask!) -> AWSTask<AnyObject>! in
                NSLog("Load one value - success")
                self?.user2 = task.result as? Requests
                print(self?.user2! as Any)
                return nil
            })
        }
        
        timer!.resume()
    }
    
    func stopTimer() {
        timer?.cancel()
        timer = nil
    }
    
    deinit {
        self.stopTimer()
    }
    
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
        startTimer() //Start timer to poll for requests
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        /*let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 1)
         let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
         viewMap = mapView*/
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        let center = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        
        mapView.camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                                  longitude: userLocation!.coordinate.longitude, zoom: 15)
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        
        let userIcon = UIImage(named: "username_icon")!.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: userIcon)
        markerView.tintColor = UIColor.red
        self.userView = markerView
        
        
        let marker = GMSMarker(position: center)
        marker.title = "Your Location"
        marker.snippet = "\(center.latitude) \(center.longitude)"
        //marker.iconView = markerView
        marker.isFlat = true
        marker.icon = UIImage(named: "username_icon")
        marker.tracksViewChanges = true
        marker.map = mapView
        self.userMarker = marker
        
        findCloseDrivers();
        
        locationManager.stopUpdatingLocation()
    }
    
    func mapView(_ mapView: GMSMapView, idleAtCameraPosition position: GMSCameraPosition) {
        UIView.animate(withDuration: 5.0, animations: { () -> Void in
            self.userView?.tintColor = UIColor.blue
        }, completion: {(finished: Bool) -> Void in
            // Stop tracking view changes to allow CPU to idle.
            self.userMarker?.tracksViewChanges = false
        })
    }
    
    func findCloseDrivers() {
        let position = CLLocationCoordinate2D(latitude: 40.423527, longitude: -86.906319)
        let marker = GMSMarker(position: position)
        marker.icon = UIImage(named: "driving")
        marker.isFlat = true
        //marker.icon = UIImage(named: "username_icon")
        marker.tracksViewChanges = true
        marker.map = mapView
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

