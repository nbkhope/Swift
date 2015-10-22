//
//  ViewController.swift
//  Project4
//
//  Created by Renan Martins on 10/11/15.
//  Copyright © 2015 nbkdev. All rights reserved.
//

import UIKit
import WebKit // for web stuff

// Inherits from a parent class and implements a protocol
class ViewController: UIViewController, WKNavigationDelegate {

	// implicitly unwrapped optional
	// 	-> property starts out as nil before being set later on
	var webView: WKWebView!
	var progressView: UIProgressView!
	
	// You should only put host names here (no additional paths)
	// Otherwise in the decidePolicyForNavigationAction,
	// your check for the allowed websites will not produced expected results
	var websites = ["github.com", "google.com", "apple.com"]
	
	override func loadView() {
		webView = WKWebView()
		webView.navigationDelegate = self
		view = webView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// The URL has to be https (don't forget to unwrap optional)
		let url = NSURL(string: "https://" + websites[0])!
		
		// You need to make the NSURL into a NSURLRequest
		webView.loadRequest(NSURLRequest(URL: url))
		
		// To be able to go back / forward
		webView.allowsBackForwardNavigationGestures = true
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: "openTapped")
		
		progressView = UIProgressView(progressViewStyle: .Default)
		progressView.sizeToFit()
		let progressButton = UIBarButtonItem(customView: progressView)
		
		let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
		//let refresh = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "refreshTapped")
		let refresh = UIBarButtonItem(barButtonSystemItem: .Refresh, target: webView, action: "reload")
		
		toolbarItems = [progressButton, spacer, refresh]
		navigationController?.toolbarHidden = false
		
		webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
	}
	
	func openTapped() {
		// Create alert controller
		let ac = UIAlertController(title: "Open page ...", message: nil, preferredStyle: .ActionSheet)
		
		// Add some actions to the alert controller
		/*
		ac.addAction(UIAlertAction(title: "google.com", style: .Default, handler: openPage))
		ac.addAction(UIAlertAction(title: "apple.com", style: .Default, handler: openPage))
		ac.addAction(UIAlertAction(title: "github.com/nbkhope", style: .Default, handler: openPage))
		*/
		for website in websites {
			ac.addAction(UIAlertAction(title: website, style: .Default, handler: openPage))
		}
		
		ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
		
		// Present the alert controller
		presentViewController(ac, animated: true, completion: nil)
	}
	
	func openPage(action: UIAlertAction!) {
		// Create a NSURL
		let url = NSURL(string: "https://" + action.title!)!
		
		// Make he NSURL into a NRSURLRequest and load the request
		webView.loadRequest(NSURLRequest(URL: url))
	}
	
	// This will be called after the page finished loading
	func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
		
		// Update the title of the view controller
		title = webView.title
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	/*
	func refreshTapped() {
		webView.reload()
	}
	*/
	
	override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
		if keyPath == "estimatedProgress" {
			progressView.progress = Float(webView.estimatedProgress)
		}
	}
	
	func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
		
		let url = navigationAction.request.URL
		
		if let host = url!.host {
			for website in websites {
				
				// will check the host against the predefined websites
				// note: if your website list had some host followed by path, then this
				// will prevent that website from loading since it only looks at the host
				// e.g.
				// 		github.com/nbkhope is the requested URL, 
				// 		but the host is only github.com.
				//		It will try to find github.com/nbkhope in "github.com," 
				//	    but that cannot be found, so it will fail. Haha.
				if host.rangeOfString(website) != nil {
					decisionHandler(.Allow)
					return
				}
			}
		}
		
		// Cancel loading if not an approved website
		decisionHandler(.Cancel)
	}
}

