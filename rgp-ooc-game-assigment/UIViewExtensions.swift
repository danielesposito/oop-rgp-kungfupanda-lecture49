//
//  UIViewExtensions.swift
//  rgp-ooc-game-assigment
//
//  Created by Daniel Esposito on 3/29/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//From
//https://www.andrewcbancroft.com/2014/07/27/fade-in-out-animations-as-class-extensions-with-swift/

import Foundation
import UIKit



    extension UIView {
        func fadeIn(duration: NSTimeInterval = 0.1, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
            UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.alpha = 1.0
                }, completion: completion)  }
        
        func fadeOut(duration: NSTimeInterval = 2, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
            UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.alpha = 0.0
                }, completion: completion)
        }
    }
    
