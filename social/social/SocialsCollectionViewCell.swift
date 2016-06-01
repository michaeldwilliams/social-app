//
//  SocialsCollectionViewCell.swift
//  social
//
//  Created by Michael Williams on 5/31/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

class SocialsCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let iconImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "coffee-cup")
        imageView.contentMode = .Center
        return imageView
    }()
    
    let label:UILabel = {
       let label = UILabel()
        label.textColor = .whiteColor()
        label.text = "Coffee"
        label.font = UIFont.systemFontOfSize(14)
        return label
    }()
    
    
    func setupView() {
        addSubview(iconImageView)
        addSubview(label)
        
        addContstraintsWithFormat("V:|-4-[v0]-4-[v1]-4-|", views: iconImageView, label)
        addContstraintsWithFormat("H:|-8-[v0]-8-|", views: iconImageView)
        addContstraintsWithFormat("H:|-8-[v0]-8-|", views: label)
    }
}
