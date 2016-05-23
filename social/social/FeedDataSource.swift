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
/*
 private let cellIdentifier = "Cell"
 var posts = ["1","2","3","4"]
 
 func registerCellsForTableView(tableView:UITableView) {
 tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
 }
 
 func numberOfSectionsInTableView(tableView: UITableView) -> Int {
 return posts.count
 }
 
 func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return 1
 }
 func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
 
 cell.textLabel?.text = "Row: \(indexPath.row)"
 
 return cell
 }
 */