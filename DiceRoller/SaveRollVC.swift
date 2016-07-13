//
//  SaveRollVC.swift
//  DiceRoller
//
//  Created by Litman, Michael on 7/13/16.
//  Copyright © 2016 Litman, Michael. All rights reserved.
//

import UIKit

class SaveRollVC: UIViewController
{

    @IBOutlet weak var roll2SaveLabel: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.roll2SaveLabel.text = Core.currentRoll
        self.nameTF.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonPressed()
    {
        if(self.nameTF.text == "")
        {
            let vc = UIAlertController(title: "Error", message: "You must first enter a name for the roll", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            vc.addAction(okAction)
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else
        {
            Core.savedRollList.rollNames.append(self.nameTF.text!)
            Core.savedRollList.rollDetails.append(self.roll2SaveLabel.text!)
            Core.savedRollList.tableView.reloadData()
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonPressed()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
