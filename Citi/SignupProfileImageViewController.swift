//
//  SignupProfileImageViewController.swift
//  Citi
//
//  Created by Darrell Shi on 10/4/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider
import AWSCognito
import AWSDynamoDB

class SignupProfileImageViewController: UIViewController {
    @IBOutlet weak var shortBioTextView: UITextView!
    @IBOutlet weak var profileImageView: UIImageView!

    var user: User?
    
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
    
    func resizeImage(_ image: UIImage, newSize: CGSize) -> UIImage {
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

    @IBAction func onGetStarted(_ sender: AnyObject) {
        user?.bio = shortBioTextView.text
        user?.saveUser()
        
        if (user?.userType == "tourist") {
            self.performSegue(withIdentifier: "TouristMapSegue", sender: nil)
        }
        else if (user?.userType == "tour_guide") {
            self.performSegue(withIdentifier: "TourGuideMapSegue", sender: nil)
        }
        
    }
    
}

// This is where the saving to S3 (image) and DynamoDB (data) is done.
func saveUser(_ user: User)  {
    precondition(user.userId != nil, "You should provide a user object with a userId when saving a user")
    precondition(user.name != nil, "You should provide a user object with a name when saving a user")
    precondition(user.email != nil, "You should provide a user object with a email when saving a user")
//    precondition(user.phoneNumber != nil, "You should provide a user object with a phoneNumber when saving a user")
    precondition(user.userType != nil, "You should provide a user object with a userType when saving a user")
    precondition(user.bio != nil, "You should provide a user object with a bio when saving a user")
    precondition(user.tags != nil, "You should provide a user object with a tags when saving a user")
    //precondition(user.ratings != nil, "You should provide a user object with a ratings when saving a user")
    //precondition(user.gpsLocation != nil, "You should provide a user object with a gpsLocation when saving a user")
    user.tags?.append("NightLife")
    
    let mapper = AWSDynamoDBObjectMapper.default()
    // We create a task that will save the user to DynamoDB
    // This works because AMZUser extends AWSDynamoDBObjectModel and conforms to AWSDynamoDBModeling
    let saveToDynamoDBTask: AWSTask = mapper.save(user)
    
    saveToDynamoDBTask.continue({ (task) -> AnyObject? in
        return nil
    })
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
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (user?.userType == "tourist") {
            let view = segue.destination as! MapViewController
            view.user = user
        }
        else if (user?.userType == "tour_guide") {
            let view = segue.destination as! TourGuideMapViewController
            view.user = user
        }
    }
}
