//
//  CustomInforWindow.swift
//  Citi
//
//  Created by Kinshuk Juneja on 11/18/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit

class CustomMarker: UIView {

    @IBOutlet weak var userImage: UIImageView!
    
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

