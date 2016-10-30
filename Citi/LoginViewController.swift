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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userinfoTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(_ sender: AnyObject) {
        //let pool = AWSCognitoIdentityUserPool(forKey: "Citi Users")

        //TODO login
        /*
        let user  = pool.getUser("darrell@ms.com")
        user.getSession("darrell@ms.com", password: "Abcd1234", validationData: nil).continue ({ (task) -> Any? in
            print("task.error", task.error)
            print("task.result", task.result)
            switch (task.error, task.result) {
            case let (error?, _):
                DispatchQueue.main.async { print("error") }
                print(error.localizedDescription)
//            case let (_, result?) where result.user.confirmedStatus != .confirmed :
//                DispatchQueue.main.async {
//                }
            default:
                DispatchQueue.main.async { print("default")
                self.performSegue(withIdentifier: "ToMapView", sender: self)
                }
            }
            
            return nil
        })
        */
            
    }
    
//    var password: AWSTaskCompletionSource = AWSTaskCompletionSource.init()
    
    
    

}

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
