//
//  Requests.swift
//  Citi
//
//  Created by Tushar Sharma on 06/12/16.
//  Copyright © 2016 Citi. All rights reserved.
//
import Foundation
import AWSDynamoDB
import UIKit
import CoreLocation

class Tours : AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var tour_id: String?
    var Active: Bool?
    var tour_guide: String?
    var tourist: String?

    //    static var users: [User] = []
    
    //    override init!() { super.init() }
    //
    //    required init!(coder: NSCoder!) {
    //        super.init(coder: coder)
    //        //fatalError("init(coder:) has not been implemented")
    //    }
    //
    //    override init(dictionary dictionaryValue: [AnyHashable : Any]!, error: ()) throws {
    //        try super.init(dictionary: dictionaryValue, error: error)
    //    }
    
    class func dynamoDBTableName() -> String {
        return "Tours"
    }
    
    class func hashKeyAttribute() -> String {
        return "tourist"
    }
    
    // class func ignoreAttributes() -> [String] {
    //   return ["password", "tags", "gpsLocation", "tripHistory"]
    //}
    
    //    var tags:[String]?
    
    func saveTour() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        
        dynamoDBObjectMapper.save(self).continue({ (task) -> AnyObject? in
            DispatchQueue.main.async(execute: {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                if let _ = task.result {
                    print("Successfully saved tour")
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
    
    func checkTours(hash: String) -> AWSTask<AnyObject>! {
        let mapper = AWSDynamoDBObjectMapper.default()
        return mapper.load(Tours.self, hashKey: hash, rangeKey: nil)
    }

    
    //    static func loadAllUsers() {
    //        let scanExpression = AWSDynamoDBScanExpression();
    //        scanExpression.limit = 10
    //
    //        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
    //        dynamoDBObjectMapper.scan(User.self, expression: scanExpression).continue({ (task) -> Any? in
    //            if task.error == nil {
    //                print("Sucess loading all users")
    //                if let exception = task.exception {
    //                    print("exception")
    //                    print(exception.reason ?? "")
    //                }
    //
    //                if let result = task.result {
    //                    for item in result.items {
    //                        users.append(item as! User)
    //                    }
    //                    print(result.items)
    //                } else {
    //                    print("no result")
    //                }
    //            } else {
    //                print("Failed to load users")
    //                print(task.error.debugDescription)
    //            }
    //
    //            return nil
    //        })
    //    }
}