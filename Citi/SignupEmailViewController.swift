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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkInput()->Bool {
        if let email = emailTextField.text {
            if email == "" {
                showAlert(title: "Error", message: "Please enter email")
                return false
            }
        }
        
        if let password = passwordTextField.text {
            if password == "" {
                showAlert(title: "Error", message: "Please enter password")
                return false
            }
            if let passwordConfir = passwordConfTextField.text {
                if passwordConfir == "" {
                    showAlert(title: "Error", message: "Please enter password confirmation")
                    return false
                }
                if password != passwordConfir {
                    showAlert(title: "Error", message: "Password does not mastch confirmation")
                    return false
                }
            }
        }
        return true
    }
    
    @IBAction func onRegister(_ sender: AnyObject) {
        if !checkInput() {
            return
        }
        
        var attributes = [AWSCognitoIdentityUserAttributeType]()
        let email = AWSCognitoIdentityUserAttributeType()!
        email.name = "email"
        email.value = emailTextField.text!
        attributes.append(email)
        
        pool.signUp(emailTextField.text!, password: passwordTextField.text!, userAttributes: attributes, validationData: nil).continue(with: AWSExecutor.mainThread(), with: {
            (task:AWSTask!) -> AnyObject! in
            if task.error != nil {
                let alert = UIAlertController.init(title: "Failed to Sign Up", message: task.error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                currUser = pool.getUser(self.emailTextField.text!)
                
                let alert = UIAlertController.init(title: "Welcome to Citi!", message: "Now please verify your email address", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                    self.performSegue(withIdentifier: "ShowEmailVerification", sender: nil)
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            return nil
        })

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let user = User()
        user.email = emailTextField.text
        user.password = passwordTextField.text
        
        if segue.identifier == "ShowEmailVerification" {
            let view = segue.destination as! SignupEmailVerificationViewController
            view.user = user
        }
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
