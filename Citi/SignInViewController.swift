//
//  SignIn.swift
//  Citi
//
//  Created by Vishal Gill on 10/1/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    //outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        intializeTextFields()

        
        
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
    
    //go to sign up screen
    @IBAction func segueToSignUp(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "toSignUp", sender: self)
    }
    

    
    
    
    
    
}
