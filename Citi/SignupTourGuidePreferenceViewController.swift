//
//  SignupTourGuidePreferenceViewController.swift
//  Citi
//
//  Created by Nadeem Mahmood on 11/2/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit

class SignupTourGuidePreferenceViewController: UIViewController {

    var user: User?
    @IBOutlet weak var tagField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            user?.tags?.append(tagField.text!)
            let view = segue.destination as! SignupProfileImageViewController
            view.user = user
    }

}
