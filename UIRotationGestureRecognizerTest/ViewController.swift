//
//  ViewController.swift
//  UIRotationGestureRecognizerTest
//
//  Created by Satoru Sasozaki on 1/11/17.
//  Copyright © 2017 Satoru Sasozaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    var lastRotation: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add rotation gesture (to rotate)
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotatedTextField(_:)))
        redView.addGestureRecognizer(rotate)
    }

    // http://www.avocarrot.com/blog/implement-gesture-recognizers-swift/
    func rotatedTextField(_ sender: UIRotationGestureRecognizer) {
        
        var originalRotation = CGFloat()
        if sender.state == .began {
            
            // the last rotation is the relative rotation value when rotation stopped last time,
            // which indicates the current rotation
            originalRotation = lastRotation
            
            // sender.rotation renews everytime the rotation starts
            // delta value but not absolute value
            sender.rotation = lastRotation
            
        } else if sender.state == .changed {
            
            let newRotation = sender.rotation + originalRotation
            sender.view?.transform = CGAffineTransform(rotationAngle: newRotation)
            
        } else if sender.state == .ended {
            
            // Save the last rotation
            lastRotation = sender.rotation
            
        }
    }
}

