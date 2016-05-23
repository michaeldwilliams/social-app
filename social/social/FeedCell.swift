//
//  FeedCell.swift
//  social
//
//  Created by Michael Williams on 5/23/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        let attributedText = NSMutableAttributedString(string: "Michael Williams", attributes: [NSFontAttributeName:UIFont.boldSystemFontOfSize(14)])
        
        attributedText.appendAttributedString(NSAttributedString(string: "\nMay 23  •  Los Angeles, CA  •  ", attributes: [NSFontAttributeName:UIFont.systemFontOfSize(10), NSForegroundColorAttributeName:UIColor.lightGrayColor()]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "globe")
        attachment.bounds = CGRectMake(0, -2, 12, 12)
        attributedText.appendAttributedString(NSAttributedString(attachment: attachment))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    let profileImg:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .ScaleAspectFit
//        imageView.backgroundColor = .redColor()
        return imageView
    }()
    
    let postTextView:UITextView = {
        let textView = UITextView()
        textView.text = "This is text from a post!"
        textView.font = UIFont.systemFontOfSize(14)
        return textView
    }()
    
    let postImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "coffee")
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
        
    }()
    
    func setupViews() {
        backgroundColor = .whiteColor()
        addSubview(nameLabel)
        addSubview(profileImg)
        addSubview(postTextView)
        addSubview(postImageView)
        addContstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImg, nameLabel)
        addContstraintsWithFormat("V:|-8-[v0]", views: nameLabel)
        addContstraintsWithFormat("V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-100-|", views: profileImg, postTextView, postImageView)
        addContstraintsWithFormat("H:|-4-[v0]-4-|", views: postTextView)
        addContstraintsWithFormat("H:|[v0]|", views: postImageView)
    }
    
}

extension UIView {
    func addContstraintsWithFormat(format:String, views:UIView...) {
        var viewsDictionary = [String:UIView]()
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}