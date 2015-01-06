//
//  PlayersViewController.swift
//  Ratings
//
//  Created by Tyler Laracuente on 1/5/15.
//  Copyright (c) 2015 Tyler Laracuente. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    //called to dismiss the 'Add Player' modal View
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //called to dismiss the 'Add Player' modal View
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    var players: [Player] = playersData 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
            //Check for existing cells that may be recycled. If none, create one.
            let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
                as PlayerCell
            
            //Look up Player object corresponding to the row being populated and assign it to player
            let player = players[indexPath.row] as Player
            
            
            //Now that we have the labels hooked up to an IBOutlet, we can adjust their text properties directly
            cell.nameLabel.text = player.name
            cell.gameLabel.text = player.game
            cell.ratingImageView.image = imageForRating(player.rating) 
            
            /*
            //check for Name UILabel in the new "PlayerCell" as tagged by 100
            if let nameLabel = cell.viewWithTag(100) as? UILabel {
                nameLabel.text = player.name
            }
            
            //check for Game UILabel in the new "PlayerCell" as tagged by 101
            if let gameLabel = cell.viewWithTag(101) as? UILabel {
                gameLabel.text = player.game
            }
            
            //check for UIImage View in the new "PlayerCell" as tagged by 102
            if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
                ratingImageView.image = self.imageForRating(player.rating)
            }
            */
            
            return cell
    }
    
    func imageForRating(rating:Int) -> UIImage? {
        switch rating {
        case 1:
            return UIImage(named: "1StarSmall")
        case 2:
            return UIImage(named: "2StarsSmall")
        case 3:
            return UIImage(named: "3StarsSmall")
        case 4:
            return UIImage(named: "4StarsSmall")
        case 5:
            return UIImage(named: "5StarsSmall")
        default:
            return nil
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
