//
//  AddPostController.swift
//  social
//
//  Created by Michael Williams on 5/26/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit
import ChameleonFramework
import Photos

class AddPostController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let textView = UITextView(frame: UIScreen.mainScreen().bounds)
    var cancelButton:UIBarButtonItem?
    var postButton:UIBarButtonItem?
    var navBar: UINavigationBar?
    var toolBar:UIToolbar?
    var post:Post!
    var imagePicker:UIImagePickerController?
    var imageURL = NSURL()
    var addPostImageView:UIImageView?
    var downloadURL = NSURL()
    
    func cancelPost() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func postPost() {
        self.post.createdDate = convertCurrentTimeToString()
        self.downloadURL = FirebaseService.sharedInstance.savePostImages(self.imageURL, user: "MichaelWilliams")
        let postArray:[String:AnyObject] = ["name":self.post.name, "profileImageName":self.post.profileImageName!, "textContent":self.textView.text, "imageContentName":"\(self.downloadURL)", "createdDate":self.post.createdDate]
        dismissViewControllerAnimated(true) {
            FirebaseService.sharedInstance.savePost(postArray)
        }
    }
    
    func convertCurrentTimeToString() -> String {
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let convertedDateString = dateFormatter.stringFromDate(currentDate)
        return convertedDateString
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        textView.becomeFirstResponder()

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        post = Post(name:"Michael Williams", profileImageName: "cool")
        
        
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 64))
        let navItem = UINavigationItem(title: "Post")
        cancelButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(AddPostController.cancelPost))
        postButton = UIBarButtonItem(title: "Post", style: .Done, target: self, action: #selector(AddPostController.postPost))
        cancelButton?.tintColor = .whiteColor()
        postButton?.tintColor = .whiteColor()
        navItem.leftBarButtonItem = cancelButton
        navItem.rightBarButtonItem = postButton
        navBar?.setItems([navItem], animated: true)
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        toolBar?.barStyle = .Default
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        fixedSpace.width = 10
        toolBar?.items = [
            UIBarButtonItem(image:UIImage(named:"image-upload") , style: .Plain, target: self, action: #selector(AddPostController.chooseImage)),fixedSpace,
            UIBarButtonItem(image: UIImage(named:"location_filled"), style: .Plain, target: self, action: nil)
        ]
        toolBar?.sizeToFit()
        
        textView.delegate = self
        textView.sizeToFit()
        textView.scrollEnabled = false
        textView.layoutIfNeeded()
        textView.inputAccessoryView = toolBar!
        textView.font = UIFont.systemFontOfSize(16)
        
        self.view.backgroundColor = .whiteColor()
        
        self.view.addSubview(textView)
        self.view.addSubview(navBar!)
        
        addPostImageView = UIImageView()
        if let imageView = self.addPostImageView {
            self.view.addSubview(imageView)
            self.view.addContstraintsWithFormat("V:|-64-[v0(44)][v1(300)]", views: textView, imageView)
            self.view.addContstraintsWithFormat("H:|[v0]|", views: imageView)
        }


//        view.addContstraintsWithFormat("V:|-64-[v0]", views: textView)
        view.addContstraintsWithFormat("H:|[v0]|", views: textView)
    }

    func chooseImage() {
        self.imagePicker = UIImagePickerController()
        if let picker = self.imagePicker {
            picker.delegate = self
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary

//            if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
//                picker.sourceType = UIImagePickerControllerSourceType.Camera
//            } else {
//                picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//            }

            presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    func animateTextView(textView: UITextView, up: Bool) {
        let movementDistance:CGFloat = -130
        let movementDuration: Double = 0.3
        
        var movement:CGFloat = 0
        if up {
            movement = movementDistance
        }
        else {
            movement = -movementDistance
        }
        UIView.beginAnimations("animateTextView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
    }

    
    func textViewDidBeginEditing(textView: UITextView) {
//        self.animateTextView(textView, up:true)

    }
    
    func textViewDidEndEditing(textView: UITextView) {
//        self.animateTextView(textView, up:false)
    }
    
    // MARK: UIImagePickerController Delegates
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let refURL = info[UIImagePickerControllerReferenceURL] as! NSURL
        let assets = PHAsset.fetchAssetsWithALAssetURLs([refURL], options: nil)
        let asset = assets.firstObject
        asset?.requestContentEditingInputWithOptions(nil, completionHandler: { (contentEditingInput,info) in
            self.imageURL = (contentEditingInput?.fullSizeImageURL)!
        })
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.addPostImageView?.contentMode = .ScaleAspectFit
        self.addPostImageView?.image = chosenImage
        self.addPostImageView?.layer.masksToBounds = true
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
