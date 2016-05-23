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
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 400)
    }
}
