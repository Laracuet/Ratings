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
    
    @IBOutlet weak var starSlider: UISlider!
    @IBOutlet weak var setStarsImage: UIImageView!
    
    var player:Player!
    var game:String = "Chess"
    var rating:Int = 3
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        var currentValue = Int(sender.value)
        
        switch currentValue {
        case 1:
            setStarsImage.image = UIImage(named: "1StarSmall")
        case 2:
            setStarsImage.image = UIImage(named: "2StarsSmall")
        case 3:
            setStarsImage.image = UIImage(named: "3StarsSmall")
        case 4:
            setStarsImage.image = UIImage(named: "4StarsSmall")
        case 5:
            setStarsImage.image = UIImage(named: "5StarsSmall")
        default:
            setStarsImage.image = UIImage(named: "1StarSmall")
        }
        rating = currentValue 
    }
    
    
    //ensures that nameTextField becomes first responder when the
    //user taps anywhere on the first table row
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    //Handles a segue from this view to another depending on the reason for the segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: self.nameTextField.text, game: game, rating: rating)
        }
        if segue.identifier == "PickGame" {
            let gamePickerViewController = segue.destinationViewController as GamePickerViewController
            gamePickerViewController.selectedGame = game
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = game
        setStarsImage.image = UIImage(named: "3Stars")
    }
    
    //Unwind segue method for selecting a game in the gamePickerView
    @IBAction func selectedGame(segue:UIStoryboardSegue) {
        let gamePickerViewController = segue.sourceViewController as GamePickerViewController
        if let selectedGame = gamePickerViewController.selectedGame {
            detailLabel.text = selectedGame
            game = selectedGame
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
}

