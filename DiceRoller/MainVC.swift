//
//  MainVC.swift
//  DiceRoller
//
//  Created by Litman, Mike on 7/11/16.
//  Copyright © 2016 Litman, Michael. All rights reserved.
//

import UIKit

class MainVC: UIViewController
{

    
    @IBOutlet weak var d4Button: UIButton!
    @IBOutlet weak var d6Button: UIButton!
    @IBOutlet weak var d8Button: UIButton!
    @IBOutlet weak var d10Button: UIButton!
    @IBOutlet weak var d12Button: UIButton!
    @IBOutlet weak var d20Button: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func screen3ButtonPressed()
    {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("Screen3") as! Screen3VC
        vc.text2Set = self.myLabel.text!
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func diceButtonPressed(sender: UIButton)
    {
        var sides = -1
        if(sender == self.d4Button)
        {
            sides = 4
        }
        else if(sender == self.d6Button)
        {
            sides = 6
        }
        else if(sender == self.d8Button)
        {
            sides = 8
        }
        else if(sender == self.d10Button)
        {
            sides = 10
        }
        else if(sender == self.d12Button)
        {
            sides = 12
        }
        else if(sender == self.d20Button)
        {
            sides = 20
        }
        self.myLabel.text = "\(sides)"
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier != nil)
        {
            if(segue.identifier! == "Screen2")
            {
                let vc = segue.destinationViewController as! Screen2VC
                vc.text2set = self.myLabel.text!
            }
        }
    }

}
