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
    var userMarker: GMSMarker?
    var userView: UIImageView?
    
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
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
    
    func mapView(mapView: GMSMapView, idleAtCameraPosition position: GMSCameraPosition) {
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
