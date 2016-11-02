//
//  User.swift
//  Citi
//
//  Created by Darrell Shi on 10/6/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import AWSDynamoDB

class User : AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var userId: String?
    var password: String?
    var name: String?
    var preferredName: String?
    var phoneNumber: String?
    var userType: String?
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
    
    class func ignoreAttributes() -> [String] {
        return ["password"]
    }
    
    
    func saveUser() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        
        dynamoDBObjectMapper.save(self).continue({ (task) -> AnyObject? in
            DispatchQueue.main.async(execute: {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                if let _ = task.result {
                    //completion(true, nil)
                }
                else if let error = task.error {
                    print(error.localizedDescription)
                    //completion(false, error as NSError?)
                }
                else {
                    //completion(false, nil)
                }
            })
            return nil
        })
    }
    
    func loadUser(hash: String) -> AWSTask<AnyObject>! {
        let mapper = AWSDynamoDBObjectMapper.default()
        return mapper.load(User.self, hashKey: hash, rangeKey: nil)
        
    }
}
