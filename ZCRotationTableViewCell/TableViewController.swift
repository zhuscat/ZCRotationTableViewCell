//
//  TableViewController.swift
//  AnimatedCellDemo
//
//  Created by Leaf on 16/5/8.
//  Copyright © 2016年 zhuscat. All rights reserved.
//

import UIKit

let identifier = "reuseIdentifier"

class TableViewController: UITableViewController {
    
    var datasource = ["#1", "#2", "#3", "#4", "#5", "#6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(ZCRotationTableViewCell.self, forCellReuseIdentifier: identifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = datasource[indexPath.row]
        (cell as! ZCRotationTableViewCell).transformToLeft = { [unowned self] in
            self.datasource.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
        return cell
    }
}
