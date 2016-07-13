//
//  SavedRollsVC.swift
//  DiceRoller
//
//  Created by Litman, Michael on 7/13/16.
//  Copyright © 2016 Litman, Michael. All rights reserved.
//

import UIKit

class SavedRollsVC: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonPressed()
    {
        if(Core.currentRoll == "")
        {
            let vc = UIAlertController(title: "Error", message: "You must first build a roll on the Home screen!", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            vc.addAction(okAction)
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else
        {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SaveRollVC") as! SaveRollVC
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
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
