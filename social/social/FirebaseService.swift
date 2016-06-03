//
//  FirebaseService.swift
//  social
//
//  Created by Michael Williams on 5/28/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit
import Firebase

class FirebaseService {

    static let sharedInstance = FirebaseService()
    
    let ref = FIRDatabase.database().reference()
    let storageRef = FIRStorage.storage().referenceForURL("gs://social-23c49.appspot.com")
    var downloadURL:NSURL?
    
    private init() {}
    
    func savePost(post:[String:AnyObject]) {
        let postRef = ref.child("posts").childByAutoId()
        postRef.setValue(post)
    }
    
    func getAllPosts(feedController:FeedController) {
        let postRef = ref.child("posts")
        postRef.observeEventType(.Value, withBlock: { snapshot in
//            print(snapshot.value)
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(key: key, dictionary: postDictionary)
                        post.createdDate = self.firebaseDateToDisplayDate(post.createdDate)
                        feedController.posts.insert(post, atIndex: 0)
                    }
                }
            }
            
        })
    }
    
    func getNewPosts(feedController:FeedController) {
        let postRef = ref.child("posts")
        postRef.observeEventType(.ChildAdded, withBlock: { snapshot in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(key: key, dictionary: postDictionary)
                        post.createdDate = self.firebaseDateToDisplayDate(post.createdDate)
                        feedController.posts.insert(post, atIndex: 0)
                    }
                }
            }
            
        })

    }

    func firebaseDateToDisplayDate(createdDate:String) -> String {
        var postDate = createdDate
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date1 = dateFormatter.dateFromString(postDate)
        let elapsedSeconds = NSCalendar.currentCalendar().components(.Second, fromDate: date1!, toDate: currentDate, options: []).second
        let elapsedMinutes = NSCalendar.currentCalendar().components(.Minute, fromDate: date1!, toDate: currentDate, options: []).minute
        if elapsedSeconds < 60 {
            postDate = "\(elapsedSeconds) seconds ago"
        }
        else if elapsedSeconds > 60 && elapsedMinutes < 60 {
            postDate = "\(elapsedMinutes) minutes ago"
        }
        else {
            let dateFormatter2 = NSDateFormatter()
            dateFormatter2.dateFormat = "MMM d, yyyy h:mm a"
            postDate = dateFormatter2.stringFromDate(date1!)
        }
        return postDate
    }
    
    
    func savePostImages(url:NSURL, user:String) {
        let imageURL = url
        let filePath = user +
            "/\(Int(NSDate.timeIntervalSinceReferenceDate() * 1000))/\(url.lastPathComponent!)"
        let imagesRef = storageRef.child("postImages").child(filePath)
        imagesRef.putFile(imageURL, metadata: nil) {metadata, error in
            if (error != nil) {
                print("Error:\(error?.localizedDescription)")
            }
            else {
                self.downloadURL = metadata!.downloadURL()
            }
        }
    }










}
