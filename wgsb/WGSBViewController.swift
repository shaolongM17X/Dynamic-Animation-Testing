//
//  WGSBViewController.swift
//  wgsb
//
//  Created by Shaolong Lin on 7/27/16.
//  Copyright © 2016 Shaolong Lin. All rights reserved.
//

import UIKit

class WGSBViewController: UIViewController {
	
	
	@IBOutlet weak var sbView: WGSBView! {
		didSet {
			sbView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addSB(_:))))
		}
	}

	
	func addSB(recognizor: UITapGestureRecognizer) {
		if recognizor.state == .Ended {
			sbView.addSB()
		}
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		sbView.animating = true
	}
	
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		sbView.animating = false
	}
	
}
