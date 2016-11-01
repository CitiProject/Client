//
//  User.swift
//  Citi
//
//  Created by Darrell Shi on 10/6/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import AWSDynamoDB

enum UserType {
    case tourist
    case tour_guide
    case both
}

class User : AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var userId: String?
    var email: String?
    var password: String?
    var name: String?
    var preferredName: String?
    var phoneNumber: String?
    var userType: UserType?
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
}
