//
//  SignupNameViewController.swift
//  Citi
//
//  Created by Darrell Shi on 10/4/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit
import AWSCognito
import AWSCognitoIdentityProvider

class SignupNameViewController: UIViewController {
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var preferredNameTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullnameTextField.delegate = self
        preferredNameTextField.delegate = self
        phoneNumTextField.delegate = self
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
        if fullnameTextField.text == "" {
            showAlert(title: "Error", message: "Please enter name")
            return false
        }
        if phoneNumTextField.text == "" {
            showAlert(title: "Error", message: "Please enter phone number for contact")
            return false
        }
        return true
    }
    
    @IBAction func onNext(_ sender: AnyObject) {
        if !checkInput() {
            return
        }
        
        var attributes = [AWSCognitoIdentityUserAttributeType]()
        let fullname = AWSCognitoIdentityUserAttributeType()!
        fullname.name = "name"
        fullname.value = fullnameTextField.text!
        attributes.append(fullname)
        
        let preferredName = AWSCognitoIdentityUserAttributeType()!
        preferredName.name = "preferred username"
        preferredName.value = preferredNameTextField.text!
        attributes.append(preferredName)
        
        let phoneNum = AWSCognitoIdentityUserAttributeType()!
        phoneNum.name = "phone number"
        phoneNum.value = phoneNumTextField.text!
        attributes.append(phoneNum)
        
        /*currUser.update(attributes).continue(with: .default(), with: { (task) -> Any? in
            if task.error == nil {
                self.showAlert(title: "success", message: nil)
            } else {
                self.showAlert(title: "failure", message: nil)
            }
            return nil
            }
        )*/
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        user?.name = fullnameTextField.text
        user?.phoneNumber = phoneNumTextField.text
        let view = segue.destination as! SignupOptionViewController
        view.user = user
    }
    

}

extension SignupNameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fullnameTextField {
            preferredNameTextField.becomeFirstResponder()
        } else if textField == preferredNameTextField {
            phoneNumTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
