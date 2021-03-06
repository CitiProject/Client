//
//  CurrentTouristViewController.swift
//  Citi
//
//  Created by Vishal Gill on 12/8/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import UIKit
import AWSCognitoIdentityProvider
import AWSCognito


class CurrentTouristViewController: UIViewController {
    
    @IBOutlet weak var tourGuideNameLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    var user: User?
    var tour: Tours?
    var tour_guide: User?
    var timer: Timer?
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //start timer immediately
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CurrentTouristViewController.updateTimer), userInfo: nil, repeats: true)
        
        //get tour row associated with user
        self.tour?.checkTours(hash: (user?.email)!).continue(successBlock: { (task:
            AWSTask!) -> AWSTask<AnyObject>! in
            NSLog("Load one value - success")
            self.tour = task.result as? Tours
            print(self.tour! as Any)
            return nil
        })
        
        self.tour_guide?.loadUser(hash: (self.tour?.tourguide_id)!).continue(successBlock: { (task:
            AWSTask!) -> AWSTask<AnyObject>! in
            NSLog("Load one user - success")
            self.tour_guide = task.result as? User
            
            //set label
            self.tourGuideNameLabel.text = self.tour_guide?.name
            
            print(self.tour_guide! as Any)
            return nil
        })

    }
    
    func updateTimer(){
        counter += 1
        
        let hours = counter / 3600
        let minutes = counter / 60
        let seconds = counter % 60
        
        if(hours < 10){
            timerLabel.text = "0" + String(hours) + ":"
        }else{
            timerLabel.text = String(hours) + ":"
        }
        
        if(minutes < 10){
            timerLabel.text = timerLabel.text! + "0" + String(minutes) + ":"
        }else{
            timerLabel.text = timerLabel.text! + String(minutes) + ":"
        }
        
        if(seconds < 10){
            timerLabel.text = timerLabel.text! + "0" + String(seconds)
        }else{
            timerLabel.text = timerLabel.text! + String(seconds)
        }
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    let view = segue.destination as! PayNowViewController
      //  view.user = user
        //view.tour = tour
      //  view.tour_guide = tour_guide
    //}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
