//
//  CurrentTourViewController.swift
//  Citi
//
//  Created by Vishal Gill on 12/8/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import UIKit
import AWSCognitoIdentityProvider
import AWSCognito


class CurrentTourViewController: UIViewController {
    
    @IBOutlet weak var touristNameLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var endTourButton: UIButton!
    
    
    
    
    
    var user: User?
    var tour: Tours?
    var tourist: User?
    var timer: Timer?
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //start timer immediately
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CurrentTourViewController.updateTimer), userInfo: nil, repeats: true)
        
        //display tour row associated with user
        self.tour?.checkTours(hash: (self.user?.email)!).continue(successBlock: { (task:
            AWSTask!) -> AWSTask<AnyObject>! in
            NSLog("Load one value - success")
            self.tour = task.result as? Tours
            print(self.tour! as Any)
            return nil
        })
        
        //load tourist
        self.tourist?.loadUser(hash: (self.tour?.tourist)!).continue(successBlock: { (task:
            AWSTask!) -> AWSTask<AnyObject>! in
            NSLog("Load one user - success")
            self.tourist = task.result as? User
            print(self.tourist! as Any)
            return nil
        })
        
        //set label
        touristNameLabel.text = tourist?.name
        
        
        

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
    
    @IBAction func endTourNow(_ sender: Any) {
        tour?.duration = timerLabel.text
        tour?.saveTour()
        
        performSegue(withIdentifier: "toPayNow", sender: self)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = segue.destination as! PayNowViewController
        view.user = user
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
