//
//  SignupProfileImageViewController.swift
//  Citi
//
//  Created by Darrell Shi on 10/4/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit

class SignupProfileImageViewController: UIViewController {
    @IBOutlet weak var shortBioTextView: UITextView!
    @IBOutlet weak var profileImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.contentMode = UIViewContentMode.scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 60
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapProfileImage(_ sender: AnyObject) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) -> Void in
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.allowsEditing = true
            vc.sourceType = UIImagePickerControllerSourceType.camera
            self.present(vc, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction) -> Void in
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.allowsEditing = true
            vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(vc, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func onChangeProfile() {
//        let profileImage = resizeImage(image: profileImageView.image!, newSize: CGSize(width: 128, height: 128))
//        if let imageData = UIImagePNGRepresentation(profileImage) {
//            user!["profile"] = imageData
//            //            let pffile = PFFile(name: "image.png", data: imageData)
//            //            user?.addObject(pffile!, forKey: "profile_image")
//            user?.saveInBackgroundWithBlock({ (success, error) -> Void in
//                self.loadingHUD?.dismiss()
//                if success {
//                    self.popupMessage("Profile uploaded!")
//                } else {
//                    self.popupMessage("Failed to upload profile image")
//                    print(error.debugDescription)
//                }
//            })
//        }
    }
    
    func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
        let frame = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        let resizeImageView = UIImageView(frame: frame)
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
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

extension SignupProfileImageViewController: UITextViewDelegate {
    
}

extension SignupProfileImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let edited = info[UIImagePickerControllerEditedImage] as! UIImage
        profileImageView.image = edited
        picker.dismiss(animated: true, completion: nil)
        self.onChangeProfile()
    }
}
