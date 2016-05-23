//
//  FeedTVC.swift
//  social
//
//  Created by Michael Williams on 5/22/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit

class FeedTVC: UITableViewController {

    var dataSource:FeedDataSource?
    
    override func viewDidLoad() {
        view.backgroundColor = .blueColor()
        tableView.dataSource = dataSource
        dataSource?.registerCellsForTableView(tableView)
    }
}