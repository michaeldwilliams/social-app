//
//  SocialsViewController.swift
//  social
//
//  Created by Michael Williams on 5/26/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

class SocialsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var flowLayout:UICollectionViewFlowLayout?
    var collectionView:UICollectionView?
    var socialCell = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout = UICollectionViewFlowLayout()
//        flowLayout?.itemSize = CGSize(width: 150, height: 200)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout!)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: socialCell)
        collectionView?.backgroundColor = .whiteColor()
        self.view.addSubview(collectionView!)
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(socialCell, forIndexPath: indexPath)
        cell.backgroundColor = .grayColor()
        return cell
    }

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(115, 150);
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsetsMake(5, 5, 5, 5); //top,left,bottom,right
    }

}
