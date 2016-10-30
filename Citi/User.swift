//
//  User.swift
//  Citi
//
//  Created by Darrell Shi on 10/6/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


enum UserType {
    case tourist
    case tour_guide
}

class User {
    var name: String?
    var email: String?
    var password: String?
    var phoneNumber: String?
    var profilePicture: UIImage?
    var bio: String?
    var tags:[String]?
    var ratings: Int?
    var gpsLocation: CLLocation?
    var tripHistory: String?
    var userType: UserType?
}
