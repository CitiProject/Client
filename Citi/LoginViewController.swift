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

var currentMode = ModeType.tourist

enum ModeType {
    case tourist
    case tour_guide
}

class LoginViewController: UIViewController {
    @IBOutlet weak var userinfoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var processIndicator: UIActivityIndicatorView!
    
    var dynamoDBUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userinfoTextField.delegate = self
        passwordTextField.delegate = self
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
        if let email = userinfoTextField.text {
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
        }
        return true
    }
    
    @IBAction func onLogin(_ sender: AnyObject) {
        if !checkInput() {
            return
        }
        
        processIndicator.startAnimating()
        processIndicator.isHidden = false
        
        let user = pool.getUser(userinfoTextField.text!)
        dynamoDBUser = User()
        
        let session = user.getSession(userinfoTextField.text!, password: passwordTextField.text!, validationData: nil)
    
        session.continue(with: AWSExecutor.mainThread(), with: { (task) -> Any? in
            self.processIndicator.stopAnimating()
            if task.error != nil {
                var errorMessage = "Unknown error found"
                if let error = (task.error as! NSError).userInfo["message"] as? String {
                    errorMessage = error
                }
                let alert = UIAlertController.init(title: "Error", message: errorMessage, preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                print(task.error!)
            } else {
                self.dynamoDBUser?.loadUser(hash: self.userinfoTextField.text!).continue({ (task) -> Any? in
                    if task.error == nil {
                        NSLog("Load one value - success")
                        self.dynamoDBUser = task.result as? User
//                        print(self.dynamoDBUser!)
                        
                        currUser = pool.getUser(self.userinfoTextField.text!)
                        
                        if (self.dynamoDBUser?.userType == "tourist") {
                            print("segue to tourist")
                            DispatchQueue.main.sync() {
                                self.performSegue(withIdentifier: "TouristMapSegue", sender: nil)
                            }
                        }
                        else if (self.dynamoDBUser?.userType == "tour_guide") {
                            print("segue to tour_guide")
                            DispatchQueue.main.sync() {
                                self.performSegue(withIdentifier: "TourGuideMapSegue", sender: nil)
                            }
                        }
                        
                        return nil
                    } else {
                        print(task.error ?? "Error")
                        return nil
                    }
                })
            }
            return nil
        })
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (dynamoDBUser?.userType == "tourist") {
            let view = segue.destination as! MapViewController
            view.user = dynamoDBUser
        }
        else if (dynamoDBUser?.userType == "tour_guide") {
            let view = segue.destination as! TourGuideMapViewController
            view.user = dynamoDBUser
        }
    }
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
