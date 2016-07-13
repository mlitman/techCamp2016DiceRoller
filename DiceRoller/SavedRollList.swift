//
//  SavedRollList.swift
//  DiceRoller
//
//  Created by Litman, Michael on 7/12/16.
//  Copyright © 2016 Litman, Michael. All rights reserved.
//

import UIKit

class SavedRollList: UITableViewController
{
    var rollNames = [String]()
    var rollDetails = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Core.savedRollList = self
        let defaults = NSUserDefaults.standardUserDefaults()
        let storedRollNames = defaults.arrayForKey("storedRollNames")
        let storedRollDetails = defaults.arrayForKey("storedRollDetails")
        
        if(storedRollNames != nil)
        {
            self.rollNames.appendContentsOf(storedRollNames as! [String])
            self.rollDetails.appendContentsOf(storedRollDetails as! [String])
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(self.rollNames, forKey: "storedRollNames")
        defaults.setObject(self.rollDetails, forKey: "storedRollDetails")
        defaults.synchronize()
    }
    
    func rollDice(sides : Int) -> Int
    {
        return random() % sides + 1
    }

    func rollDiceDetails(roll: String)
    {
        let parts = roll.componentsSeparatedByString("+")
        var sum = 0
        for part in parts
        {
            if(part != "")
            {
                let roll = part.componentsSeparatedByString("D")
                let sides = Int(roll[1])!
                let rollResult = self.rollDice(sides)
                print(rollResult)
                sum += rollResult
            }
        }
        //we have our roll stored in sum
        let vc = UIAlertController(title: "Roll", message: "Result -> \(sum)", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        vc.addAction(okAction)
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.rollNames.count
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        self.rollNames.removeAtIndex(indexPath.row)
        self.rollDetails.removeAtIndex(indexPath.row)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(self.rollNames, forKey: "storedRollNames")
        defaults.setObject(self.rollDetails, forKey: "storedRollDetails")
        defaults.synchronize()
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.rollNames[indexPath.row]
        cell.detailTextLabel?.text = self.rollDetails[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.rollDiceDetails(self.rollDetails[indexPath.row])
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
