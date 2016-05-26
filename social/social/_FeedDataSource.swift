//
//  FeedDataSource.swift
//  social
//
//  Created by Michael Williams on 5/22/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

class FeedDataSource: NSObject, UICollectionViewDataSource {

    var posts = [Post]()
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let feedCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! FeedCell
        
        feedCell.post = posts[indexPath.item]
        
        return feedCell
    }
    
    
}
