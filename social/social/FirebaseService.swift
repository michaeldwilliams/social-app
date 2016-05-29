//
//  FirebaseService.swift
//  social
//
//  Created by Michael Williams on 5/28/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit
import Firebase

class FirebaseService: NSObject {

    let ref = FIRDatabase.database().reference()
    var id = String()
    
    
    func savePost(post:[String:AnyObject]) {
        let postRef = ref.child("posts").childByAutoId()
        id = postRef.key
        postRef.setValue(post)
        
    }
    
    
    
}
