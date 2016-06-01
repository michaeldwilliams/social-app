//
//  FeedTVDataSource.swift
//  social
//
//  Created by Michael Williams on 5/25/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

//import UIKit
//
//
//class FeedTVDataSource: NSObject, UITableViewDataSource {
//    
//    
//    // MARK: - Table view data source
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        print("sections: \(posts.count)")
//        return posts.count
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//       
//        let post:Post? = posts[indexPath.section]
//        
//        
//        if let _ = post?.imageContentName {
//            let photoFeedCell = tableView.dequeueReusableCellWithIdentifier(FeedController().cellId, forIndexPath: indexPath) as? FeedTVCellWithPhoto
//            photoFeedCell?.post = post
//            return photoFeedCell!
//        }
//        
//        let textFeedCell = tableView.dequeueReusableCellWithIdentifier(FeedController().textCellId, forIndexPath: indexPath) as? FeedTVCellText
//        textFeedCell?.post = post
//        return textFeedCell!
//    }
//}
