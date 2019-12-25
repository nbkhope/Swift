//
//  ViewController.swift
//  Project2
//
//  Created by nbkhope on 10/11/15.
//  Copyright © 2015 nbkdev. All rights reserved.
//

import UIKit
import GameplayKit // for random numbers

class ViewController: UIViewController {
	
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var button3: UIButton!
	
	@IBOutlet weak var scoreLabel: UILabel!
	
	var countries = [String]()
	var score = 0
	var correctAnswer = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		// Append values to array of Strings
		countries += ["brazil", "china", "estonia", "france", "germany", "ireland", "italy", "japan", "monaco", "nigeria", "poland", "russia", "south korea", "spain", "taiwan", "uk", "us"]
		
		// You can also append to the array of Strings like this:
		// countries.append("countryname")
		
		// Add border to the buttons (size is 1 point)
		button1.layer.borderWidth = 1
		button2.layer.borderWidth = 1
		button3.layer.borderWidth = 1
		
		/* 
		 * Note about point:
		 * 1 px on non-retina
		 * 2 px on retina
		 * 3 px on retina HD
		 */
		
		// Set border color
		let myColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0)
		
		// We need to convert UIColor to CGColor so the lower layer understands
		button1.layer.borderColor = myColor.CGColor
		button2.layer.borderColor = myColor.CGColor
		button3.layer.borderColor = myColor.CGColor
		
		// Alternatively, you could also use
		// button1.layer.borderColor = UIColor.lightGrayColor().CGColor
		
		askQuestion()
		
	}

	func askQuestion(action: UIAlertAction! = nil) {
		// First shuffle array of country names
		countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
		
		button1.setImage(UIImage(named: countries[0]), forState: .Normal)
		button2.setImage(UIImage(named: countries[1]), forState: .Normal)
		button3.setImage(UIImage(named: countries[2]), forState: .Normal)
		
		// Generate random number between 0 and 2
		// This number will be used as the correctAnswer
		correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
		
		// Update the title of the view controller
		title = countries[correctAnswer].uppercaseString
		
		// Update score label
		scoreLabel.text = "Score: \(score)"

	}
	
	@IBAction func buttonTapped(sender: UIButton) {
		
		// Each button has an associated tag: either 0, 1, or 2
		if sender.tag == correctAnswer {
			title = "Correct"
			++score
		} else {
			title = "Wrong"
			
			if (score > 0) {
				--score
			}
		}
		
		let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .Alert)
		
		// Note askQuestion should not have () here
		ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
		
		presentViewController(ac, animated: true, completion: nil)
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	

}

