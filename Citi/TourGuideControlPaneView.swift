//
//  TourGuideControlPaneView.swift
//  Citi
//
//  Created by Darrell Shi on 10/13/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit

class TourGuideControlPaneView: UIView {
    @IBOutlet weak var contentView: UIView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "TourGuideControlPaneView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    @IBOutlet weak var tagTextField: UISearchBar!
    
    @IBOutlet weak var distanceTextField: UITextField!
    
    
    @IBAction func onUpdateMap(_ sender: Any) {
        print("------onUpdateMap-----")
        var dic = ["tag": "", "distance": "5.0"]
        // default distance is 5.0
        
        if let tag = tagTextField.text {
            dic["tag"] = tag
        }
        if let distance_txt = distanceTextField.text {
            dic["distance"] = distance_txt
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ONUPDATEMAPCALLED"), object: dic)
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
