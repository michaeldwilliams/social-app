//
//  Post.swift
//  social
//
//  Created by Michael Williams on 5/22/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Post {
    var postRef:FIRDatabaseReference?
    
    var name:String?
    var profileImageName:String?
    var textContent:String?
    var createdDate:String?
    var imageContentName:String?
    var id:String?

    
     init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self.id = key
        
        // Within Key, the following properties are children
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let profileImageName = dictionary["profileImageName"] as? String {
            self.profileImageName = profileImageName
        }
        
        if let textContent = dictionary["textContent"] as? String {
            self.textContent = textContent
        }
        
        if let createdDate = dictionary["createdDate"] as? String {
            self.createdDate = createdDate
        }
        
        if let imageContentName = dictionary["imageContentName"] as? String {
            self.imageContentName = imageContentName
        } else {
            self.imageContentName = nil
        }
        
        // The above properties are assigned to their key.
        
        self.postRef = FirebaseService.sharedInstance.ref.child("posts").child(id!)
    }

}
