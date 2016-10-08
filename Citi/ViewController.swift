//
//  ViewController.swift
//  Citi
//
//  Created by Darrell Shi on 10/8/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider
import AWSCognito

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func ButtonPressed(_ sender: AnyObject) {
        var attributes = [AWSCognitoIdentityUserAttributeType]()
        let fullname = AWSCognitoIdentityUserAttributeType()!
        fullname.name = "name"
        fullname.value = nameTextField.text!
        attributes.append(fullname)
        
        let phoneNum = AWSCognitoIdentityUserAttributeType()!
        phoneNum.name = "phone number"
        phoneNum.value = phoneNumberTextField.text!
        attributes.append(phoneNum)
        
        currUser.update(attributes).continue(with: .default(), with: { (task) -> Any? in
            if task.error == nil {
                self.showAlert(title: "success", message: nil)
            } else {
                self.showAlert(title: "failure", message: nil)
                print(task.error)
                print(task.error.debugDescription)
                print(task.error?.localizedDescription)
            }
            return nil
            }
        )
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
