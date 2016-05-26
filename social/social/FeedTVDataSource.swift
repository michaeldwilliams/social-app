//
//  FeedTVDataSource.swift
//  social
//
//  Created by Michael Williams on 5/25/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

class FeedTVDataSource: NSObject, UITableViewDataSource {
    
    var posts = [Post]()

    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return posts.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
            if FeedTVCellWithPhoto().post?.imageContentName != "" || FeedTVCellWithPhoto().post?.imageContentName != nil {
                let photoFeedCell = tableView.dequeueReusableCellWithIdentifier(FeedTVController().cellId, forIndexPath: indexPath) as! FeedTVCellWithPhoto
                photoFeedCell.post = posts[indexPath.section]
                return photoFeedCell
            }
            else {
                let textFeedCell = tableView.dequeueReusableCellWithIdentifier(FeedTVController().textCellId, forIndexPath: indexPath) as! FeedTVCellText
                textFeedCell.post = posts[indexPath.section]
                return textFeedCell
            }
    }
}
