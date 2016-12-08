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
    
    
    
    
    
    var dynamoDBUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //start timer immediately
        
        //display tourist name
        //dynamoDBUser
        
        

    }
    
    @IBAction func endTourNow(_ sender: Any) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
