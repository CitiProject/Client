//
//  POIItem.swift
//  Citi
//
//  Created by Kinshuk Juneja on 11/19/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
/// Point of Interest Item which implements the GMUClusterItem protocol.
class POIItem: NSObject, GMUClusterItem {
    var position: CLLocationCoordinate2D
    var tourGuide: TourGuide!
    
    init(position: CLLocationCoordinate2D, tourGuide: TourGuide!) {
        self.position = position
        self.tourGuide = tourGuide
    }
}
