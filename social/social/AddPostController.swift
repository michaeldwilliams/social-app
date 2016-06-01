//
//  AddPostController.swift
//  social
//
//  Created by Michael Williams on 5/26/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit
import ChameleonFramework

class AddPostController: UIViewController, UITextViewDelegate {
    
    let textView = UITextView(frame: UIScreen.mainScreen().bounds)
    var cancelButton:UIBarButtonItem?
    var postButton:UIBarButtonItem?
    var navBar: UINavigationBar?
    var toolBar:UIToolbar?
    let post:Post! = nil
    
    func cancelPost() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func postPost() {
        self.post.textContent = textView.text
        self.post.name = "Michael Williams"
        self.post.profileImageName = "cool"
        self.post.imageContentName = "coffee"
        self.post.createdDate = convertCurrentTimeToString()
        let postArray:[String:AnyObject] = ["name":self.post.name!, "profileImageName":self.post.profileImageName!, "textContent":self.post.textContent!, "imageContentName":self.post.imageContentName!, "createdDate":self.post.createdDate!]
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
            UIBarButtonItem(image:UIImage(named:"image-upload") , style: .Plain, target: self, action: nil),fixedSpace,
            UIBarButtonItem(image: UIImage(named:"location_filled"), style: .Plain, target: self, action: nil)
        ]
        toolBar?.sizeToFit()
        
        textView.delegate = self
        textView.inputAccessoryView = toolBar!
        textView.font = UIFont.systemFontOfSize(16)
        
        self.view.addSubview(textView)
        self.view.addSubview(navBar!)

        view.addContstraintsWithFormat("V:|-64-[v0]|", views: textView)
        view.addContstraintsWithFormat("H:|[v0]|", views: textView)
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
    

}
