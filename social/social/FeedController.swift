//
//  FeedController.swift
//  social
//
//  Created by Michael Williams on 5/23/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

let cellId = "Cell"

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var dataSource = FeedDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.lightGrayColor()
        collectionView?.alwaysBounceVertical = true
        navigationItem.title = "Social"
        collectionView?.dataSource = dataSource
        
        collectionView?.registerClass(FeedCell.self, forCellWithReuseIdentifier: cellId)
        
        let aPost = Post()
        aPost.name = "Michael Williams"
        aPost.textContent = "This latte was SOOOO good! I wish I could make a magic fountain of it and shrink it so I could take it around with me and have it whenever I wanted it."
        aPost.profileImageName = "cool"
        aPost.imageContentName = "coffee"
        let bPost = Post()
        bPost.name = "John Doe"
        bPost.textContent = "Love the way they roast these beans"
        bPost.profileImageName = "profile"
        bPost.imageContentName = "beans"
        let cPost = Post()
        cPost.name = "Jane Doe"
        cPost.textContent = "I'm more of a Folgers girl, myself."
        cPost.profileImageName = "student"

        
        dataSource.posts.append(aPost)
        dataSource.posts.append(bPost)
        dataSource.posts.append(cPost)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if let textContent = dataSource.posts[indexPath.item].textContent {
            let rect = NSString(string: textContent).boundingRectWithSize(CGSizeMake(view.frame.width, 1000), options: NSStringDrawingOptions.UsesFontLeading.union(NSStringDrawingOptions.UsesLineFragmentOrigin), attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil)
            
            return CGSizeMake(view.frame.width, rect.height + 370)
        }
        
        return CGSizeMake(view.frame.width, 500)
    }
}
