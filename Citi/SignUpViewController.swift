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

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    //outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    //variables
    var pool: AWSCognitoIdentityUserPool?
    var user: AWSCognitoIdentityUser?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        intializeTextFields()
        self.pool = AWSCognitoIdentityUserPool(forKey: "Citi Users")

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func intializeTextFields(){
        //set delegates for textfields
        emailField.delegate = self
        passwordField.delegate = self
        //set placeholders for textfields
        let emailPlaceholder = "email"
        let passwordPlaceholder = "password"
        emailField.placeholder = emailPlaceholder
        passwordField.placeholder = passwordPlaceholder
    }
    
    // Dismiss the keyboard when the user taps the "Return" key or its equivalent
    // while editing a text field.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    // Dismiss the keyboard when the user taps the background
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func signUpNow(_ sender: AnyObject) {
        print("entered signUpNow")
        
        
        var attributes = [AWSCognitoIdentityUserAttributeType]()
        let email = AWSCognitoIdentityUserAttributeType()
        email?.name = "email"
        email?.value = emailField.text
        
        //signup wants an array of attributes, hence the redundency
        attributes.append(email!)
        
        
        self.pool?.signUp(emailField.text!, password: passwordField.text!, userAttributes: attributes, validationData: nil).continue({ task in
            print("task.error", task.error)
            print("task.result", task.result)
            switch (task.error, task.result) {
            case let (error?, _):
                DispatchQueue.main.async { print("error") }
                print(error.localizedDescription)
            case let (_, result?) where result.user.confirmedStatus != .confirmed :
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toLoggedIn", sender: self)
                    //need help performing segue to verifaction page
                }
            default:
                DispatchQueue.main.async { print("default") }
            }
            
            return nil
        })
        
        
        

    }
    

    


    
    
    
    
}
