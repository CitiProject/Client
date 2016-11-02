//
//  User.swift
//  Citi
//
//  Created by Darrell Shi on 10/6/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import AWSDynamoDB
import UIKit
import CoreLocation

enum UserType {
    case tourist
    case tour_guide
}

class User : AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var userId: String?
    var name: String?
    var email: String?
    var password: String?
    var phoneNumber: String?
    var profilePicture: UIImage?
    var bio: String?
    
    override init!() { super.init() }
    
    required init!(coder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func dynamoDBTableName() -> String {
        return "citi-mobilehub-2006386910-User"
    }
    class func hashKeyAttribute() -> String {
        return "userId"
    }
    
    var tags:[String]?
    var ratings: Int?
    var gpsLocation: CLLocation?
    var tripHistory: String?
    var userType: UserType?
}
