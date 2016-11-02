//
//  SignupEmailVerificationViewController.swift
//  Citi
//
//  Created by Darrell Shi on 10/8/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit
import AWSCognito
import AWSCognitoIdentityProvider

class SignupEmailVerificationViewController: UIViewController {
    @IBOutlet weak var verificationTextField: UITextField!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onVerify(_ sender: AnyObject) {
        currUser.confirmSignUp(verificationTextField.text!).continue(with: AWSExecutor.mainThread(), with: { (task: AWSTask!) -> Any? in
            if task.error == nil {
                let alert = UIAlertController.init(title: "Success", message: "Email verified", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                    self.performSegue(withIdentifier: "ShowSignupNameViewController", sender: nil)
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                print(task.error.debugDescription)
                let alert = UIAlertController.init(title: "Failure", message: "Verification code incorrect", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            return nil
            }
        )
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSignupNameViewController" {
            let view = segue.destination as! SignupNameViewController
            view.user = user
        }
    }

}
