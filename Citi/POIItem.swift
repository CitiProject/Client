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
    var name: String!
    
    init(position: CLLocationCoordinate2D, name: String) {
        self.position = position
        self.name = name
    }
}
