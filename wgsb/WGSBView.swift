//
//  WGSBView.swift
//  wgsb
//
//  Created by Shaolong Lin on 7/27/16.
//  Copyright © 2016 Shaolong Lin. All rights reserved.
//

import UIKit

class WGSBView: UIView {
	
	private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
	private let gravity = UIGravityBehavior()
	private let collider: UICollisionBehavior = {
		let collider = UICollisionBehavior()
		collider.translatesReferenceBoundsIntoBoundary = true
		return collider
	}()
	
	private func getRandomText() -> String {
		let random = arc4random_uniform(100)
		if random >= 0 && random < 10 {
			return "~~~~~~~~~~~~~~~~~~"
		} else if random >= 10 && random < 50 {
			return "SB"
		} else if random >= 50 && random < 70 {
			return "wg"
		} else {
			return "WGsb"
		}
	}
	
	var animating = false {
		didSet {
			if animating {
				animator.addBehavior(gravity)
				animator.addBehavior(collider)
			} else {
				animator.removeBehavior(gravity)
				animator.removeBehavior(collider)
			}
		}
	}
	
	func addSB() {
		let sbLabel = UITextView()
		sbLabel.text = getRandomText()
		sbLabel.font = sbLabel.font?.fontWithSize(23)
		sbLabel.sizeToFit()
		
		sbLabel.frame = getRandomPos(sbLabel.frame)
		addSubview(sbLabel)
		gravity.addItem(sbLabel)
		collider.addItem(sbLabel)
	}
	
	private func getRandomPos(frame: CGRect) -> CGRect {
		let newX = CGFloat(arc4random_uniform(UInt32(bounds.width - frame.width)))
		let newOrigin = CGPoint(x: newX, y: frame.minY)
		let newFrame = CGRect(origin: newOrigin, size: frame.size)
		return newFrame
	}
}
