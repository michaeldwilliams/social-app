//
//  FeedTVCellWithPhoto.swift
//  social
//
//  Created by Michael Williams on 5/25/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit
import QuartzCore

class FeedTVCellWithPhoto: UITableViewCell {
    
    var post:Post? {
        didSet {
            if let name = post?.name {
                
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSFontAttributeName:UIFont.boldSystemFontOfSize(14)])
                
                attributedText.appendAttributedString(NSAttributedString(string: "\n\(post!.createdDate)  •  Los Angeles, CA", attributes: [NSFontAttributeName:UIFont.systemFontOfSize(10), NSForegroundColorAttributeName:UIColor.lightGrayColor()]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 5
                
                attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                
//                let attachment = NSTextAttachment()
//                attachment.image = UIImage(named: "globe")
//                attachment.bounds = CGRectMake(0, -2, 12, 12)
//                attributedText.appendAttributedString(NSAttributedString(attachment: attachment))
                
                nameLabel.attributedText = attributedText
            }
            if let textContent = post?.textContent {
                postTextView.text = textContent
            }
            if let profileImageName = post?.profileImageName {
                profileImg.image = UIImage(named: profileImageName)
            }
            if let imageContent = post?.imageContentName {
                postImageView.image = UIImage(named: imageContent)
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: FeedController().cellId)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    let profileImg:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    let postTextView:UITextView = {
        let textView = UITextView()
        textView.text = "This is text from a post!"
        textView.font = UIFont.systemFontOfSize(14)
        textView.scrollEnabled = false
        textView.editable = false
        return textView
    }()
    
    let postImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
        
    }()
    
    let likesCommentsLabel:UILabel = {
        let label = UILabel()
        label.text = "25 Likes       10.7K Comments"
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.rgb(155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(226, green: 228, blue: 232)
        return view
    }()
    
    let likeButton = FeedTVCellWithPhoto.buttonForTitle("Like", imageName: "like")
    let commentButton = FeedTVCellWithPhoto.buttonForTitle("Comment", imageName: "comment")
    let shareButton = FeedTVCellWithPhoto.buttonForTitle("Share", imageName: "share")
    
    static func buttonForTitle(title:String, imageName:String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(UIColor.rgb(143, green: 150, blue: 163), forState: .Normal)
        button.setTitleColor(.blueColor(), forState: .Highlighted)
        button.setTitleColor(.redColor() , forState: .Selected)
        button.setImage(UIImage(named:imageName), forState: .Normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        button.titleLabel!.font = UIFont.boldSystemFontOfSize(14)
        return button
    }
    
    func setupViews() {
        backgroundColor = .whiteColor()
        addSubview(nameLabel)
        addSubview(profileImg)
        addSubview(postTextView)
        addSubview(postImageView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addContstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImg, nameLabel)
        addContstraintsWithFormat("V:|-8-[v0]", views: nameLabel)
        addContstraintsWithFormat("H:|-4-[v0]-4-|", views: postTextView)
        addContstraintsWithFormat("H:|-12-[v0]-12-|", views: dividerLineView)
        addContstraintsWithFormat("H:|-12-[v0]|", views: likesCommentsLabel)
        addContstraintsWithFormat("H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        addContstraintsWithFormat("V:[v0(44)]|", views: commentButton)
        addContstraintsWithFormat("V:[v0(44)]|", views: shareButton)
        addContstraintsWithFormat("V:|-8-[v0(44)]-4-[v1]-4-[v2(200)][v3(44)][v4(1)][v5(44)]|", views: profileImg, postTextView, postImageView, likesCommentsLabel, dividerLineView, likeButton)
        addContstraintsWithFormat("H:|[v0]|", views: postImageView)
    }
    
    
}
