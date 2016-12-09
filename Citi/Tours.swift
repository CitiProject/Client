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
    
    var active: NSNumber?
    var tourguide_id: String?
    var tour_id: String?
    var duration: String?
    
    class func dynamoDBTableName() -> String {
        return "Tours"
    }
    
    class func hashKeyAttribute() -> String {
        return "tour_id"
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

    
}
