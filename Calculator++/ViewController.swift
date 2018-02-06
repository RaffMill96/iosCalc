//
//  ViewController.swift
//  Calculator++
//
//  Created by R.M.R on 9/16/17.
//  Copyright © 2017 Rafael Millan. All rights reserved.
//

import UIKit
import Foundation //Generic

class ViewController: UIViewController {
    
    var numOnScreen:Double = 0;
    var numStored:Double = 0;
    var operation = 0;
    var performingMath = false;
    var math = "";
    
    @IBOutlet weak var mathLabel: UILabel!
    @IBOutlet weak var output: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            output.text = String(sender.tag-1)
            numOnScreen = Double(output.text!)!
            performingMath = false;
        }
        else
        {
            if sender.tag != 20
            {
                output.text = output.text! + String(sender.tag-1)
                numOnScreen = Double(output.text!)!
            }
            else if sender.tag == 20
            {
                output.text = output.text! + "."
                numOnScreen = Double(output.text!)!
            }
        }
    }
    @IBAction func operations(_ sender: UIButton)
    {
        if output.text != "" && sender.tag == 19
        {
            numOnScreen = numOnScreen * -1
            output.text = String(numOnScreen)
        }
        else if output.text != "" && sender.tag != 11 && sender.tag != 18 && sender.tag != 12 && sender.tag != 13
        {
            numStored = Double(output.text!)!
            
            if sender.tag == 14 // DIVIDE
            {
                output.text = "/"
            }
            else if sender.tag == 15 // MULTIPLY
            {
                output.text = "X"
            }
            else if sender.tag == 16 // SUBSTRACT
            {
                output.text = "-"
            }
            else if sender.tag == 17 // ADD
            {
                output.text = "+"
            }
            
            operation = sender.tag
            performingMath = true;
        }
            
        else if sender.tag == 18
        {
            if operation == 14 // DIVIDE
            {
                math = "\(numStored) / \(numOnScreen)"
                mathLabel.text = math
                
                if (numStored / numOnScreen).truncatingRemainder(dividingBy: 1) != 0
                {
                    //it's a Double
                   output.text = String(numStored / numOnScreen)
                    mathLabel.text = math + " = "
                }
                
                if (numStored / numOnScreen).truncatingRemainder(dividingBy: 1) == 0
                {
                    //it's an integer
                    let temp = Int(numStored / numOnScreen)
                    output.text = String(describing: temp)
                    mathLabel.text = math + " = "
                }
            }

            if operation == 15
            {
                math = "\(numStored) * \(numOnScreen)"
                mathLabel.text = math
                if (numStored / numOnScreen).truncatingRemainder(dividingBy: 1) != 0
                {
                    //it's a Double
                    output.text = String(numStored * numOnScreen)
                    mathLabel.text = math + " = "
                }
                
                if (numStored / numOnScreen).truncatingRemainder(dividingBy: 1) == 0
                {
                    //it's an integer
                    let temp = Int(numStored * numOnScreen)
                    output.text = String(describing: temp)
                    mathLabel.text = math + " = "
                }
            }
            if operation == 16
            {
                math = "\(numStored) - \(numOnScreen)"
                mathLabel.text = math
                
                if (numStored / numOnScreen).truncatingRemainder(dividingBy: 1) != 0
                {
                    //it's a Double
                    output.text = String(numStored - numOnScreen)
                    mathLabel.text = math + " = "
                }
                
                if (numStored / numOnScreen).truncatingRemainder(dividingBy: 1) == 0
                {
                    //it's an integer
                    let temp = Int(numStored - numOnScreen)
                    output.text = String(describing: temp)
                    mathLabel.text = math + " = "
                }
            }
            if operation == 17
            {
                math = "\(numStored) + \(numOnScreen)"
                mathLabel.text = math
                
                if (numStored / numOnScreen).truncatingRemainder(dividingBy: 1) == 0
                {
                    //it's an integer
                    
                    let temp = Int(numStored + numOnScreen)
                    output.text = String(describing: temp)
                    mathLabel.text = math + " = "
                }
                
                else if (numStored / numOnScreen).truncatingRemainder(dividingBy: 1) != 0
                {
                    //it's a Double
                    output.text = String(numStored + numOnScreen)
                    mathLabel.text = math + " = "
                }

            }
        }
        
        else if sender.tag == 12 || sender.tag == 13
        {
            if sender.tag == 12
            {
                math = "\(numOnScreen) ^ 2"
                mathLabel.text = math
                
                output.text = String(pow(numOnScreen, 2))
                mathLabel.text = math + " = "

            }
            if sender.tag == 13
            {
                math = "\(numOnScreen) ^ .5"
                mathLabel.text = math
                
                output.text = String(pow(numOnScreen, 0.5))
                mathLabel.text = math + " = "
            }
        }
            
        else if sender.tag == 11
        {
            output.text = ""
            numStored = 0;
            numOnScreen = 0;
            operation = 0;
            mathLabel.text = ""
        }
        math = ""
    }

        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

