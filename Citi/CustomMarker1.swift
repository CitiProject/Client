//
//  CustomInforWindow.swift
//  Citi
//
//  Created by Kinshuk Juneja on 11/18/16.
//  Copyright © 2016 Citi. All rights reserved.
//
import UIKit
import AWSCognitoIdentityProvider
import AWSCognito
import AWSDynamoDB

class CustomMarker1: UIView {
    
    @IBOutlet weak var userImage: UIImageView!
    var user2: Requests?
    var user: User?
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    var dynamoDBUser: Requests?
    var timer: DispatchSourceTimer?
    
    func startTimer() {
        let queue = DispatchQueue(label: "com.domain.app.timer")  // you can also use `DispatchQueue.main`, if you want
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer!.scheduleRepeating(deadline: .now(), interval: .seconds(1))
        timer!.setEventHandler { [weak self] in
            // self?.user2?.checkRequest(hash: (self?.user2?.tourguide_id)!)
            
            self?.dynamoDBUser?.checkRequest(hash: (self?.user2?.tourguide_id)!).continue(successBlock: { (task: AWSTask!) -> AWSTask<AnyObject>! in
                NSLog("Load one value - success")
                self?.dynamoDBUser = task.result as? Requests
                // print(self?.dynamoDBUser!)
                if self?.user2?.accepted == true {
                    self?.accepted()
                }
                else if self?.user2?.rejected == true {
                    self?.rejected()
                }
                
                return nil
            })
            
        }
        timer!.resume()
    }
    
    func stopTimer() {
        timer?.cancel()
        timer = nil
    }
    
    deinit {
        self.stopTimer()
    }
    
    func accepted() {
        stopTimer()
        deleteRow()
        //Do stuff for accepted
    }
    
    func rejected() {
        stopTimer()
        deleteRow()
        //Show popover with message rejected
        //return to map.
    }
    
    func deleteRow() {
        //DB code to delete row
        
    }
    
    @IBAction func execRequest(_ sender: UIButton) {
        // user2?.tourguide_id = // Assign the clicked tourguides id
        user2?.tourist_id = (user?.email)!
        user2?.accepted = false
        user2?.rejected = false
        let mapper = AWSDynamoDBObjectMapper.default()
        // We create a task that will save the user to DynamoDB
        // This works because AMZUser extends AWSDynamoDBObjectModel and conforms to AWSDynamoDBModeling
        let saveToDynamoDBTask: AWSTask = mapper.save(user2!)
        
        saveToDynamoDBTask.continue({ (task) -> AnyObject? in
            return nil
        })
        
        // Poll for response
        
        startTimer()
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CustomMarker", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
