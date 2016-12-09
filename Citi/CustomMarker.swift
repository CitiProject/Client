//
//  CustomInforWindow.swift
//  Citi
//
//  Created by Kinshuk Juneja on 11/18/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit

class CustomMarker: UIView {

    var user2 = Requests()
    var tourGuide: User?
    var tourist: User?
    var mapVC: UIViewController?
    
    
    var dynamoDBUser: Requests?
    var timer: DispatchSourceTimer?

    
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var ratingsImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
  
    
    @IBOutlet weak var ratingsView: UIView!
    
    @IBOutlet weak var userTag: UILabel!
    
    func initUserPair(tourGuideFromMapViewController: User!, touristFromMapViewController: User!, mapViewCntrlr: UIViewController) {
        tourGuide = tourGuideFromMapViewController
        tourist = touristFromMapViewController
        self.mapVC = mapViewCntrlr
        
    }
    
    @IBAction func execRequest(_ sender: UIButton) {
        
        
        let requestSuccessAlert = UIAlertController(title: "Request", message: "Your request has been sent!", preferredStyle: UIAlertControllerStyle.alert)
        
        requestSuccessAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        
        mapVC!.present(requestSuccessAlert, animated: true, completion: nil)
        
        
        
        user2?.tourguide_id = tourGuide?.email// Assign the clicked tourguides id
        user2?.tourist_id = tourist?.email//(user?.email)!
        user2?.accepted = false
        user2?.rejected = false
        print("Request started")
        user2?.saveRequest()
        
        
        startTimer()
    }
    
    func stopTimer() {
        timer?.cancel()
        timer = nil
    }
    
    deinit {
        self.stopTimer()
    }
    
    func accepted() {
        stopTimer()
        //deleteRow()
        //Do stuff for accepted
    }
    
    func rejected() {
        stopTimer()
        deleteRow()
        //Show popover with message rejected
        //return to map.
    }
    
    func deleteRow() {
        //DB code to delete row
        
    }
    
    func startTimer() {
        let queue = DispatchQueue(label: "com.domain.app.timer")  // you can also use `DispatchQueue.main`, if you want
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer!.scheduleRepeating(deadline: .now(), interval: .seconds(2))
        timer!.setEventHandler { [weak self] in
            
            print("Looping")
            self?.user2?.checkRequest(hash: (self?.user2?.tourguide_id)!).continue({ (task) -> Any? in
                if task.error == nil {
                    print("Load one value - success")
                    self?.user2 = task.result as? Requests
                    //print(self?.dynamoDBUser!)
                    
                    //currUser = pool.getUser(self.userinfoTextField.text!)
                    
                    if (self?.user2?.accepted == true) {
                        print("accepted")
                        // DispatchQueue.main.sync() {
                        //self.performSegue(withIdentifier: "TouristMapSegue", sender: nil)
                        print("accepted2")
                        //}
                    }
                    else if (self?.dynamoDBUser?.rejected == true) {
                        print("rejected")
                        DispatchQueue.main.sync() {
                            //self.performSegue(withIdentifier: "TouristMapSegue", sender: nil)
                            
                        }
                    }
                    
                    return nil
                } else {
                    print(task.error ?? "Error")
                    return nil
                }
            })
            // user2?.checkRequest(hash: (self?.user2?.tourguide_id)! )
            
            
        }
        timer!.resume()
    }
    
    
    
    
    func setUserName(name:String){
        self.userNameLabel.text = name
    }
    
    func showRatings(ratingNumber: Int){
       
        switch ratingNumber {
        case 1:
            ratingsImageView.image = UIImage(named: "starOn")
        case 2:
            ratingsImageView.image = UIImage(named: "starOn2")

        case 3:
            ratingsImageView.image = UIImage(named: "starOn3")

        case 4:
            ratingsImageView.image = UIImage(named: "starOn4")

        case 5:
            ratingsImageView.image = UIImage(named: "starOn5")
        default:
            ratingsImageView.image = UIImage(named: "starOn")

        }
        
        ratingsView.addSubview(ratingsImageView)

        
        
    }

    
  
    
    //  userName.setText("hi")
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CustomMarker", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}

