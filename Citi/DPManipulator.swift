//
//  DPManipulator.swift
//  Citi
//
//  Created by Kinshuk Juneja on 12/7/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit

class DPManipulator: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    static func cropAndRoundBorder(userImage: UIImage, userImageView:UIImageView!) -> UIImageView {
       // var imageView = UIImageView(frame: CGRectMake(100, 150, 150, 150)); // set as you want
        let imageView = userImageView!
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        
        
        
        
       // var image = UIImage(named: "myImage.png")
        imageView.image = userImage
        return imageView
        
       // self.view.addSubview(imageView)
    }
    
    
    static func getMagicalDP(userImage: UIImage?, userImageView:UIImageView!) -> UIImageView {
       // if(userImage == nil){
        if(userImage != nil){
            return cropAndRoundBorder(userImage: userImage!, userImageView: userImageView )
        } else {
            return cropAndRoundBorder(userImage: UIImage(named: "defaultDP")!, userImageView: userImageView)
        }
        //}
    }
}
