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
    
    var player:Player!
    var game:String = "Chess"
    
    //ensures that nameTextField becomes first responder when the
    //user taps anywhere on the first table row
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: self.nameTextField.text, game: "Chess", rating: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = game
    }
    
    @IBAction func selectedGame(segue:UIStoryboardSegue) {
        let gamePickerViewController = segue.sourceViewController as GamePickerViewController
        if let selectedGame = gamePickerViewController.selectedGame {
            detailLabel.text = selectedGame
            game = selectedGame
        }
        self.navigationController?.popViewControllerAnimated(true)
    }

}

