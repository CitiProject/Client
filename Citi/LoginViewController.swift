//
//  ViewController.swift
//  Citi
//
//  Created by Darrell Shi on 9/15/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider
import AWSCognito

class LoginViewController: UIViewController {
    @IBOutlet weak var userinfoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    //var passwordAuthenticationCompletion: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userinfoTextField.delegate = self
        passwordTextField.delegate = self
        
       // passwordAuthenticationCompletion = AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(_ sender: AnyObject) {
        print("on Login")
        //passwordAuthenticationCompletion!.setResult(AWSCognitoIdentityPasswordAuthenticationDetails.init(username: "darrell@ms.com", password: "Abcd1234"))
        
        
        let userPool = AWSCognitoIdentityUserPool(forKey: "Citi Users")
        let user = userPool.getUser(userinfoTextField.text!)
        
        user.getSession(userinfoTextField.text!, password: passwordTextField.text!, validationData: nil).continue(with: AWSExecutor.mainThread(), with: {
            (task:AWSTask!) -> AnyObject! in
            
            if task.error != nil {
                let alert = UIAlertController.init(title: "Error", message: "Cannot login", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                print(task.error)
            } else {
                let alert = UIAlertController.init(title: "Success!", message: "logged in", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                    self.performSegue(withIdentifier: "ToMapView", sender: nil)

                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            return nil
        })
    }
}

/*
extension LoginViewController: AWSCognitoIdentityPasswordAuthentication {
    func getDetails(_ authenticationInput: AWSCognitoIdentityPasswordAuthenticationInput, passwordAuthenticationCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>) {
        passwordAuthenticationCompletion = passwordAuthenticationCompletionSource
        
        print("AWSCognitoIdentityPasswordAuthentication")
    }
    
    func didCompleteStepWithError(_ error: Error?) {
        print("didCompleteStepWithError")
        DispatchQueue.main.async {
            if error != nil {
                let alert = UIAlertController.init(title: "Error", message: "Cannot login", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "ToMapView", sender: self)
            }
        }
    }
}
*/

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userinfoTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
