//
//  DetailViewController.swift
//  Project1
//
//  Created by nbkhope on 10/5/15.
//  Copyright © 2015 nbkdev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


	@IBOutlet weak var detailImageView: UIImageView!


	var detailItem: String? {
		/* didSet will be executed any time the property value has been changed */
		didSet {
		    // Update the view.
		    self.configureView()
		}
	}

	func configureView() {
		// Update the user interface for the detail item.
		if let detail = self.detailItem {
		    if let imageView = self.detailImageView {
				imageView.image = UIImage(named: detail)
				
				// UIView Controller has data member:
				// 	public var title: String?
				self.title = "Viewing " + detail
				
				//self.title = "Viewing " + self.detailItem
				// Use ! to unwrap optional (we are sure there will be value assigned to detailItem)
		    }
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.configureView()
	}
	
	/**
	 * Add the following two methods to add hide menu functionality
	 */
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
		
		/**
		 * All view controllers have an optional property called
		 * navigationController, which, if set, lets us reference the
		 * navigation controller we are inside.
		 */
	}
	
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

