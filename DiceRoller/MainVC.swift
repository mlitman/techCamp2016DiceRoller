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

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var d4Button: UIButton!
    @IBOutlet weak var d6Button: UIButton!
    @IBOutlet weak var d8Button: UIButton!
    @IBOutlet weak var d10Button: UIButton!
    @IBOutlet weak var d12Button: UIButton!
    @IBOutlet weak var d20Button: UIButton!
    @IBOutlet weak var rollText: UITextView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func screen3ButtonPressed()
    {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("Screen3") as! Screen3VC
        vc.text2Set = self.rollText.text!
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func deleteButtonPressed(sender: AnyObject)
    {
        let parts = self.rollText.text!.componentsSeparatedByString("+")
        self.rollText.text = ""
        for i in 0 ..< parts.count-1
        {
            if(self.rollText.text! == "")
            {
                self.rollText.text = parts[i]
            }
            else
            {
                self.rollText.text = "\(self.rollText.text!)+\(parts[i])"
            }
        }
    }
    
    @IBAction func rollButtonPressed(sender: AnyObject)
    {
       let parts = self.rollText.text!.componentsSeparatedByString("+")
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
        self.resultLabel.text = "\(sum)"
    }
    
    func rollDice(sides : Int) -> Int
    {
        return random() % sides + 1
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
        if(self.rollText.text! == "")
        {
            self.rollText.text = "D\(sides)"
        }
        else
        {
            self.rollText.text = "\(self.rollText.text!)+D\(sides)"
        }
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
                vc.text2set = self.rollText.text!
            }
        }
    }

}
