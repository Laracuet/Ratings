//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Tyler Laracuente on 1/6/15.
//  Copyright (c) 2015 Tyler Laracuente. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }

}

