//
//  FeedController.swift
//  social
//
//  Created by Michael Williams on 5/26/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit


class FeedController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
//    var dataSource = FeedTVDataSource()
    let cellId = "PhotoCell"
    let textCellId = "TextCell"
    let firebaseService = FirebaseService.sharedInstance
    var posts = [Post]() {
        didSet {
            tableView.reloadData()

        }
    }
    
    func addPost() {
        presentViewController(AddPostController(), animated: true, completion: nil)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarColor:UIView = {
            let bar = UIView()
            bar.backgroundColor = UIColor.rgb(248, green: 148, blue: 6)
            return bar
        }()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(FeedTVCellWithPhoto.self, forCellReuseIdentifier: cellId)
        tableView.registerClass(FeedTVCellText.self, forCellReuseIdentifier: textCellId)
        self.view.addSubview(tableView)
        self.view.addSubview(statusBarColor)
        
        self.navigationItem.title = "Feed"
        
        //Add Post Button
        let addPost = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(FeedController.addPost))
        self.navigationItem.rightBarButtonItem = addPost
        addPost.tintColor = .whiteColor()
        
        self.view.backgroundColor = UIColor.rgb(248, green: 148, blue: 6)
        tableView.backgroundColor = UIColor.rgb(218, green: 223, blue: 225)
        tableView.alwaysBounceVertical = true
        
        self.view.addContstraintsWithFormat("V:|[v0]|", views: tableView)
        self.view.addContstraintsWithFormat("H:|[v0]|", views: tableView)
        self.view.addContstraintsWithFormat("V:|[v0(20)]|", views: statusBarColor)
        self.view.addContstraintsWithFormat("H:|[v0]|", views: statusBarColor)
    
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
    
        firebaseService.getAllPosts(self)
        firebaseService.getNewPosts(self)

    }
    
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 7
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clearColor()
        
        return header
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post:Post? = posts[indexPath.section]
        
        
        if let _ = post?.imageContentName {
            let photoFeedCell = tableView.dequeueReusableCellWithIdentifier(self.cellId, forIndexPath: indexPath) as? FeedTVCellWithPhoto
            photoFeedCell?.post = post
            return photoFeedCell!
        }
        
        let textFeedCell = tableView.dequeueReusableCellWithIdentifier(self.textCellId, forIndexPath: indexPath) as? FeedTVCellText
        textFeedCell?.post = post
        return textFeedCell!
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
