//
//  TourGuide.swift
//  Citi
//
//  Created by Darrell Shi on 11/3/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import AWSDynamoDB

class TourGuide: User {
    static var tourGuides: [TourGuide] = []
    
//    override init!() {
//        online = true
//        super.init()
//        userType = UserType.tour_guide
//    }
//    
//    required init!(coder: NSCoder!) {
//        online = true
//        super.init(coder: coder)
//        //fatalError("init(coder:) has not been implemented")
//    }
//    
//    override init(dictionary dictionaryValue: [AnyHashable : Any]!, error: ()) throws {
//        online = true
//        try super.init(dictionary: dictionaryValue, error: error)
//    }
    
    static func loadTagTourGuides(tag: String) {
        let scanExpression = AWSDynamoDBScanExpression();
        scanExpression.limit = 10
        scanExpression.expressionAttributeValues = [":userTag" : tag]
        scanExpression.filterExpression = "tags = :userTag"
        
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        dynamoDBObjectMapper.scan(TourGuide.self, expression: scanExpression).continue({ (task) -> Any? in
            if task.error == nil {
                print("Sucess loading all tour guides")
                if let exception = task.exception {
                    print("exception")
                    print(exception.reason ?? "")
                }
                
                if let result = task.result {
                    for item in result.items {
                        tourGuides.append(item as! TourGuide)
                    }
                    //                    print(result.items)
                } else {
                    print("no result")
                }
            } else {
                print("Failed to load tour guides")
                print(task.error.debugDescription)
            }
            
            return nil
        })
        
    }
    
    static func loadTourGuides() {
        let scanExpression = AWSDynamoDBScanExpression();
        scanExpression.limit = 10
        scanExpression.expressionAttributeValues = [":userType" : "tour_guide"]
        scanExpression.filterExpression = "userType = :userType"
        
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        dynamoDBObjectMapper.scan(TourGuide.self, expression: scanExpression).continue({ (task) -> Any? in
            if task.error == nil {
                print("Sucess loading all tour guides")
                if let exception = task.exception {
                    print("exception")
                    print(exception.reason ?? "")
                }
                
                if let result = task.result {
                    for item in result.items {
                        tourGuides.append(item as! TourGuide)
                    }
                    //                    print(result.items)
                } else {
                    print("no result")
                }
            } else {
                print("Failed to load tour guides")
                print(task.error.debugDescription)
            }
            
            return nil
        })
        
        /*
        let queryExpression = AWSDynamoDBQueryExpression()
//        queryExpression.indexName = "name"
        
        queryExpression.expressionAttributeValues = [":userType" : "tour_guide"]
        queryExpression.keyConditionExpression = "userType = :userType"
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        
        dynamoDBObjectMapper.query(TourGuide.self, expression: queryExpression).continue({ (task) -> Any? in
            if task.error == nil {
                print("Sucess loading tour guides")
                if let result = task.result {
                    for item in result.items {
                        print(item)
                    }
                }
            } else {
                print("Failed to load tour guides")
                print(task.error.debugDescription)
            }
            return nil
        })

        */
        
        /*
 
         AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
         
         queryExpression.indexName = @"Author-Price-index";
         
         queryExpression.hashKeyAttribute = @"Author";
         queryExpression.hashKeyValues = @"John Smith";
         
         queryExpression.rangeKeyConditionExpression = @"Price < :val";
         queryExpression.expressionAttributeValues = @{@":val":@50};
         
         [[dynamoDBObjectMapper query:[Book class]
         expression:queryExpression]
         continueWithBlock:^id(AWSTask *task) {
         if (task.error) {
         NSLog(@"The request failed. Error: [%@]", task.error);
         }
         if (task.exception) {
         NSLog(@"The request failed. Exception: [%@]", task.exception);
         }
         if (task.result) {
         AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
         for (Book *book in paginatedOutput.items) {
         //Do something with book.
         }
         }
         return nil;
         }];
 
 
        */
    }
}
