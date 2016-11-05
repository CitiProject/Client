//
//  SignupOptionViewController.swift
//  Citi
//
//  Created by Darrell Shi on 10/4/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit

class SignupOptionViewController: UIViewController {
    @IBOutlet weak var optionSegmentedControl: UISegmentedControl!

    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNext(_ sender: AnyObject) {
        if optionSegmentedControl.selectedSegmentIndex == 0 { // tourist
            performSegue(withIdentifier: "TouristSegue", sender: nil)
        } else { // tour guide or both
            performSegue(withIdentifier: "TourGuideSegue", sender: nil)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch optionSegmentedControl.selectedSegmentIndex {
        case 0:
            user?.userType = "tourist"
        case 1:
            user?.userType = "tour_guide"
        default:
            user?.userType = "tourist"
        }
        
        if optionSegmentedControl.selectedSegmentIndex == 0 { // tourist
            let view = segue.destination as! SignupProfileImageViewController
            view.user = user
        } else { // tour guide or both
            let view = segue.destination as! SignupTourGuidePreferenceViewController
            view.user = user
        }
    }
    

}
