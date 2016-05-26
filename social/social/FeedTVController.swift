//
//  FeedTVController.swift
//  social
//
//  Created by Michael Williams on 5/25/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

class FeedTVController: UITableViewController {

    var dataSource = FeedTVDataSource()
    let cellId = "PhotoCell"
    let textCellId = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.backgroundColor = UIColor.lightGrayColor()
        tableView?.alwaysBounceVertical = true
        navigationItem.title = "Social"
        tableView?.dataSource = dataSource
        tableView?.registerClass(FeedTVCellWithPhoto.self, forCellReuseIdentifier: cellId)
        tableView?.registerClass(FeedTVCellText.self, forCellReuseIdentifier: textCellId)
        
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
        cPost.imageContentName = nil
        let dPost = Post()
        dPost.name = "Tim Doe"
        dPost.textContent = "Boy, do I love french fries!"
        dPost.profileImageName = "profile"
        dPost.imageContentName = nil
        let ePost = Post()
        ePost.name = "John Doe"
        ePost.textContent = "Hate the way they roast these beans"
        ePost.profileImageName = "profile"
        ePost.imageContentName = "beans"
        
        dataSource.posts.append(aPost)
        dataSource.posts.append(bPost)
        dataSource.posts.append(cPost)
        dataSource.posts.insert(dPost, atIndex: 0)
        dataSource.posts.insert(ePost, atIndex: 0)
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        tableView.reloadData()
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 7
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clearColor()
        
        return header
    }
}

   

