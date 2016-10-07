//
//  SignUpViewController.swift
//  Citi
//
//  Created by Vishal Gill on 10/1/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import UIKit
import AWSCore
import AWSCognitoIdentityProvider

class LoggedInViewController: UIViewController, UITextFieldDelegate {

    
    
    
    //outlets
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var confirmationNumberField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!

    
    
    //variables
    var pool: AWSCognitoIdentityUserPool?
    var user: AWSCognitoIdentityUser?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pool = AWSCognitoIdentityUserPool(forKey: "Citi Users")
        //label1.text = pool?.currentUser()
        let cnpholder = "Enter #"
        confirmationNumberField.placeholder = cnpholder

        label1.text = user?.username
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func confirmPressed(){
        self.user?.confirmSignUp(confirmationNumberField.text!).continue({ task in
            print("task.error", task.error)
            print("task.result", task.result)
            switch (task.error, task.result) {
            case let (error?, _):
                //place UIAlert
                DispatchQueue.main.async { print("confirmation failed") }
                print(error.localizedDescription)
            case let (_, result?):
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toConfirmed", sender: self)
                    //need help performing segue to verifaction page
                }
            default:
                break
                
            }
            return nil
        })
    
    }
    
    
    
    
}
