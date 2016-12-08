//
//  CustomInforWindow.swift
//  Citi
//
//  Created by Kinshuk Juneja on 11/18/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit

class CustomMarker: UIView {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var ratingsImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
  
    
    @IBOutlet weak var ratingsView: UIView!
    
    @IBOutlet weak var userTag: UILabel!
    

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

