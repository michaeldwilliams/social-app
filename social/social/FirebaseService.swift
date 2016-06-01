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
    
    private init() {}
    
    func savePost(post:[String:AnyObject]) {
        let postRef = ref.child("posts").childByAutoId()
        postRef.setValue(post)
    }
    
    func getAllPosts() {
        let postRef = ref.child("posts")
        postRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
//            print(snapshot.value)
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(key: key, dictionary: postDictionary)
                        FeedController.sharedFeedInstance.posts.insert(post, atIndex: 0)
                    }
                }
                 print("posts received: \(FeedController.sharedFeedInstance.posts.count)")
            }
            
        })
    }

    
}
