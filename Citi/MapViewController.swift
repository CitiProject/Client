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

class MapViewController: UIViewController, CLLocationManagerDelegate, GMUClusterManagerDelegate, GMSMapViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var userRoleSwitch: UISwitch!
    @IBOutlet weak var userRoleText: UILabel!
    @IBOutlet weak var tourGuideControlPaneView: TourGuideControlPaneView!
    @IBOutlet weak var addressSearch: UISearchBar!
    
    var user: User?
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    var userMarker: GMSMarker?
    private var clusterManager: GMUClusterManager!
    var displayedInfoWindow: UIView?
    
    var markerTapped = false
    var cameraMoving = false
    var idleAfterMovement = false
    var currentlyTappedMarker: GMSMarker?
    let customMarker:CustomMarker = CustomMarker.loadFromNib()
    var activePoint : POIItem?
    
    var markers = [String:GMSMarker]()
    let geocoder = CLGeocoder()

    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.becomeFirstResponder()
        getCoordinates(address: searchBar.text!)
        
        view.endEditing(true)
        
    }

    
    func getCoordinates(address : String) {
        
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error", error!)
            }
            if let placemark = placemarks?.first {
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                self.mapView.camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude,
                                                          longitude: coordinates.longitude, zoom: 10)
            }
        })
        
    }
    
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
    
    @IBAction func onSearchAndUpdateMap(_ sender: Any) {
        let tag = tagTextField.text
        let distance = Double(distanceTextField.text!)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addressSearch.delegate = self
        
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

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last

        mapView.camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                                  longitude: userLocation!.coordinate.longitude, zoom: 15)
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        
       //  let userIcon = UIImage(named: "username_icon")!.withRenderingMode(.alwaysTemplate)
       //  let markerView = UIImageView(image: userIcon)
       //   markerView.tintColor = UIColor.red
       // self.userView = markerView
        self.mapView.delegate = self
        self.view.addSubview(self.mapView)
        
        findCloseDrivers();
        
        //   locationManager.stopUpdatingLocation()
    }
    
    func getUpdatedTourGuideLocations() {
        TourGuide.loadTourGuides()
        
        let tg = TourGuide.tourGuides
        
        print("NUMBER OF TOUR GUIDES: ", tg.count)
        
        for eachTourGuide: TourGuide in tg {
            
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
            
            print("drawing a tour guide")
            print(String(format: "%f %f", tempLatitude, tempLongitude))
            
            let position = CLLocationCoordinate2D(latitude: tempLatitude, longitude: tempLongitude)
            
            self.markers[eachTourGuide.name!]?.position = position
            self.markers[eachTourGuide.name!]?.title = eachTourGuide.name
        }
        
    }
    
    func findCloseDrivers() {
        
        let iconGenerator = GMUDefaultClusterIconGenerator()
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: mapView,
                                                 clusterIconGenerator: iconGenerator)
        clusterManager = GMUClusterManager(map: mapView, algorithm: algorithm,
                                           renderer: renderer)
        
        if TourGuide.tourGuides.count == 0 {
            return
        }
        
        if drawnTourGuides {
            return
        }
        
        let tg = TourGuide.tourGuides
        
        print("NUMBER OF TOUR GUIDES: ", tg.count)
        
        for eachTourGuide: TourGuide in tg {
            
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
            
            print("drawing a tour guide")
            print(String(format: "%f %f", tempLatitude, tempLongitude))
            
            let position = CLLocationCoordinate2D(latitude: tempLatitude, longitude: tempLongitude)
            
            
            let name = eachTourGuide.name ?? " "
            let item =
                POIItem(position: position, name: name)
            clusterManager.add(item)
            
        }
        
        drawnTourGuides = true
        locationManager.stopUpdatingLocation()
        
        print("cluster manager")
        clusterManager.cluster()
        clusterManager.setDelegate(self, mapDelegate: self)
        
    }

    func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) {
        let newCamera = GMSCameraPosition.camera(withTarget: cluster.position,
                                                           zoom: mapView.camera.zoom + 1)
        let update = GMSCameraUpdate.setCamera(newCamera)
        mapView.moveCamera(update)
    }
    
    // MARK: - GMUMapViewDelegate
 //   var infoWindow = CustomInfoWindow()
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if (marker.userData as? POIItem) != nil {
            
            print("tapped dat marker ass")
            
            var flag = true
            if (marker == currentlyTappedMarker) {
                flag = false
            }
          
            //A marker has been tapped, so set that state flag
            self.markerTapped = true
            
            //If a marker has previosly been tapped and stored in curretnlyTappedMarker, then nil it out
            if( self.currentlyTappedMarker != nil) {
                self.currentlyTappedMarker = nil
            }
            
            //make this marker our curretnly tapped marker
            self.currentlyTappedMarker = marker
            
            
            
            //if custom info window is already being displayed remove it and nil the object
            if (flag && (self.displayedInfoWindow != nil) && (self.displayedInfoWindow?.isDescendant(of: self.view))!) {
                self.displayedInfoWindow?.removeFromSuperview()
                self.displayedInfoWindow = nil
            }
            
            /* animate the camera to center on the currently tapped marker, which causes
             mapView:didChangeCameraPosition: to be called */
           // let newCamera = GMSCameraPosition.camera(withTarget: marker.position,
                           //                          zoom: mapView.camera.zoom)
           // let update = GMSCameraUpdate.setCamera(newCamera)
           // mapView.moveCamera(update)
            
            
            
            
            
            
            
            mapView.animate(toLocation: marker.position)
         //   self.cameraMoving = true
            mapView.selectedMarker = marker
            
            var point = mapView.projection.point(for: marker.position)
            point.y = point.y - 250
            
            let newPoint = mapView.projection.coordinate(for: point)
            let camera = GMSCameraUpdate.setTarget(newPoint)
            mapView.animate(with: camera)
            
            
            
            
            
            
            
            
            
            if(self.markerTapped && !self.cameraMoving) {
                //create custom info window
                
                self.displayedInfoWindow = customMarker
                
                self.displayedInfoWindow?.frame.origin.x = 0
                self.displayedInfoWindow?.frame.origin.y = 0
                
                self.displayedInfoWindow?.frame.origin.x += 25
                self.displayedInfoWindow?.frame.origin.y += 80
                self.view.addSubview(self.displayedInfoWindow!)
               // self.displayedInfoWindow?.frame.origin.x -= 25
               // self.displayedInfoWindow?.frame.origin.y -= 80
            }

        } else {
            NSLog("Did tap a normal marker")
            print("Did tap a normal marker")
           
            
   
            
        }
        return true
    }
    
    
/*    func mapView(_ mapView: GMSMapView, didChange cameraPosition: GMSCameraPosition){
        /* if we got here after we've previously been idle and displayed our custom info window,
         then remove that custom info window and nil out the object */
        if(self.idleAfterMovement) {
            if((self.displayedInfoWindow != nil) && (self.displayedInfoWindow?.isDescendant(of: self.view))!){
                self.displayedInfoWindow?.removeFromSuperview()
                self.displayedInfoWindow = nil
            }
        }

        // if we got here after a marker was tapped, then set the cameraMoving state flag to YES
        if(self.markerTapped) {
            self.cameraMoving = true
        }
    }*/
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        /* if we got here and a marker was tapped and our animate method was called, then it means we're ready
         to show our custom info window */
        if(self.markerTapped && self.cameraMoving) {
            //reset our state
            self.cameraMoving = false
            self.markerTapped = false
            self.idleAfterMovement = true
            
            //create custom info window
            self.displayedInfoWindow = customMarker
           
            //displayedInfoWindow.center = mapView.projection.pointForCoordinate(poiItem.position)
            // activePoint = poiItem
            
            self.view.addSubview(self.displayedInfoWindow!)
    
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        if((self.currentlyTappedMarker) != nil) {
            self.currentlyTappedMarker = nil
        }
        
        if((self.displayedInfoWindow != nil ) && (self.displayedInfoWindow?.isDescendant(of: self.view))!) {
            self.displayedInfoWindow?.removeFromSuperview()
            self.displayedInfoWindow = nil
        }
    }

    /*
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        
        if let tempPoint = activePoint {
            customMarker.center = mapView.projection.point(for: tempPoint.position)
        }
        
    }
    
    */
    
    /*   func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
     
     UIView.animate(withDuration: 5.0, animations: { () -> Void in
     self.userView?.tintColor = UIColor.blue
     }, completion: {(finished: Bool) -> Void in
     // Stop tracking view changes to allow CPU to idle.
     self.userMarker?.tracksViewChanges = false
     })
     
     
     } */
    var drawnTourGuides = false
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

