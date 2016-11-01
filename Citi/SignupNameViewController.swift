//
//  SignupNameViewController.swift
//  Citi
//
//  Created by Darrell Shi on 10/4/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit

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
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        user?.name = fullnameTextField.text
        user?.preferredName = preferredNameTextField.text
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
