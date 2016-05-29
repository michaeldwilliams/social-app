//
//  FeedController.swift
//  social
//
//  Created by Michael Williams on 5/26/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit
import BLKFlexibleHeightBar


class FeedController: UIViewController, UITableViewDelegate, UIScrollViewDelegate {
    
    let tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
    var dataSource = FeedTVDataSource()
    let cellId = "PhotoCell"
    let textCellId = "TextCell"
    
    
    func addPost() {
        presentViewController(AddPostController(), animated: true, completion: nil)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnSwipe = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarColor:UIView = {
            let bar = UIView()
            bar.backgroundColor = UIColor.rgb(248, green: 148, blue: 6)
            return bar
        }()

        tableView.dataSource = dataSource
        self.tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        self.view.addSubview(statusBarColor)
        navigationItem.title = "Feed"
        let addPost = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(FeedController.addPost))
        self.navigationItem.rightBarButtonItem = addPost
        addPost.tintColor = .whiteColor()
        
        
        
        self.view.backgroundColor = UIColor.rgb(248, green: 148, blue: 6)
        tableView.backgroundColor = UIColor.rgb(218, green: 223, blue: 225)
        tableView.alwaysBounceVertical = true
        tableView.registerClass(FeedTVCellWithPhoto.self, forCellReuseIdentifier: cellId)
        tableView.registerClass(FeedTVCellText.self, forCellReuseIdentifier: textCellId)
        
        self.view.addContstraintsWithFormat("V:|[v0]|", views: tableView)
        self.view.addContstraintsWithFormat("H:|[v0]|", views: tableView)
        self.view.addContstraintsWithFormat("V:|[v0(20)]|", views: statusBarColor)
        self.view.addContstraintsWithFormat("H:|[v0]|", views: statusBarColor)
        
        let aPost = Post()
        aPost.name = "Michael Williams"
        aPost.textContent = "This latte was SOOOO good! I wish I could make a magic fountain of it and shrink it so I could take it around with me and have it whenever I wanted it."
        aPost.profileImageName = "cool"
        aPost.imageContentName = "coffee"
        let bPost = Post()
        bPost.name = "John Doe"
        bPost.textContent = "Love the way they roast these beans"
        bPost.profileImageName = "mustache"
        bPost.imageContentName = "beans"
        let cPost = Post()
        cPost.name = "Jane Doe"
        cPost.textContent = "I'm more of a Folgers girl, myself."
        cPost.profileImageName = "student"
        cPost.imageContentName = nil
        let dPost = Post()
        dPost.name = "Tim Doe"
        dPost.textContent = "Boy, do I love french fries!"
        dPost.profileImageName = "mustache"
        dPost.imageContentName = nil
        let ePost = Post()
        ePost.name = "John Doe"
        ePost.textContent = "Hate the way they roast these beans"
        ePost.profileImageName = "mustache"
        ePost.imageContentName = "beans"
        
        dataSource.posts.append(aPost)
        dataSource.posts.append(bPost)
        dataSource.posts.append(cPost)
        dataSource.posts.append(dPost)
        dataSource.posts.append(ePost)
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        tableView.reloadData()

        
    }
    
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 7
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clearColor()
        
        return header
    }
    
    
}


extension UIColor {
    static func rgb(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
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
