//
//  User.swift
//  Citi
//
//  Created by Darrell Shi on 10/6/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation

enum UserType {
    case tourist
    case tour_guide
    case both
}

class User {
    var email: String?
    var password: String?
    var name: String?
    var preferredName: String?
    var phoneNumber: String?
    var userType: UserType?
    var bio: String?
}
