//
//  SignIn.swift
//  Citi
//
//  Created by Vishal Gill on 10/1/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set placeholders for textfields
        let emailPlaceholder = "email"
        let passwordPlaceholder = "password"
        emailField.placeholder = emailPlaceholder
        passwordField.placeholder = passwordPlaceholder
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "press" {
            self.performSegue(withIdentifier: "press", sender: AnyObject.self)
        }
    }
    
    */    
    

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        emailField.resignFirstResponder();
        passwordField.resignFirstResponder();
        return true;
    }
    
    
    
}
