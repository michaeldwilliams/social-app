//
//  FeedDataSource.swift
//  social
//
//  Created by Michael Williams on 5/22/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

class FeedDataSource: NSObject, UICollectionViewDataSource {

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)
    }
    
    
}
