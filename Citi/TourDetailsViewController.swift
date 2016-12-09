//
//  TourDetailsViewController.swift
//  Citi
//
//  Created by Vishal Gill on 12/8/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import UIKit
import AWSCognitoIdentityProvider
import AWSCognito

class ToursDetailsViewController: UIViewController {
    
    @IBOutlet weak var tourGuideName: UILabel!
    @IBOutlet weak var touristName: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var tourLengthLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var payNowLabel: UILabel!

    var user: User?
    var tour: Tours?
    var tourist: User?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //display tour row associated with user
        self.tour?.checkTours(hash: (self.user?.email)!).continue(successBlock: { (task:
            AWSTask!) -> AWSTask<AnyObject>! in
            NSLog("Load one value - success")
            self.tour = task.result as? Tours
            print(self.tour! as Any)
            return nil
        })
        
        //load tourist
        self.tourist?.loadUser(hash: (self.tour?.tour_id)!).continue(successBlock: { (task:
            AWSTask!) -> AWSTask<AnyObject>! in
            NSLog("Load one user - success")
            self.tourist = task.result as? User
            
            self.tourGuideName.text = self.user?.name
            self.touristName.text = self.tourist?.name
            self.rateLabel.text = String(describing: self.user?.rate)
            self.tourLengthLabel.text = self.tour?.duration
            self.totalLabel.text = String(describing: self.returnTotal())
            
            print(self.tourist! as Any)
            return nil
        })
        
 
    }

    func returnTotal()->NSNumber{
        let time: String = (tour?.duration)!
        let timeArray = time.components(separatedBy: ":")
        
        let hours = timeArray[0]
        let minutes = timeArray[1]
        //var seconds = timeArray[2]
        
        let rate = Int((user?.rate)!)
        let intHours = Int(hours)
        let intMinutes = Int(minutes)
        
        
        let total = (intHours! * rate) + ((intMinutes!/60) * rate)
        let NSTotal = NSNumber(value:total)
        
        return NSTotal
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
