//
//  SocialsViewController.swift
//  social
//
//  Created by Michael Williams on 5/26/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

class SocialsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var flowLayout:UICollectionViewLayout?
    var collectionView:UICollectionView?
    var socialCell = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout = UICollectionViewLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout!)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: socialCell)
        collectionView?.backgroundColor = .whiteColor()
        self.view.addSubview(collectionView!)
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(socialCell, forIndexPath: indexPath)
        cell.backgroundColor = .grayColor()
        return cell
    }

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(50, 50);
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsetsMake(5, 5, 5, 5); //top,left,bottom,right
    }

}
