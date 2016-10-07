//
//  SignupEmailViewController.swift
//  Citi
//
//  Created by Darrell Shi on 10/4/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider
import AWSCognito

class SignupEmailViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfTextField: UITextField!

    let POOL_KEY = "us-east-1_N4DDsBWjP"
    let EMAIL_KEY = "EMAIL_KEY"
    let PASSWORD_KEY = "PASSWORD_KEY"
    
    var pool: AWSCognitoIdentityUserPool?

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfTextField.delegate = self
        
        pool = AWSCognitoIdentityUserPool(forKey: POOL_KEY)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onNext(_ sender: AnyObject) {
        var attributes = [AWSCognitoIdentityUserAttributeType]()
        let email = AWSCognitoIdentityUserAttributeType()
        email?.name = EMAIL_KEY
        email?.value = emailTextField.text
        
        attributes.append(email!)
        pool?.signUp(emailTextField.text!, password: passwordTextField.text!, userAttributes: attributes, validationData: nil)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SignupEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordConfTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
