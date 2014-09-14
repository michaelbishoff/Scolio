//
//  AngleViewController.swift
//  Scolio
//
//  Created by Robert S Mozayeni on 9/13/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit
import CoreMotion

class AngleViewController: UIViewController {
    let motionManager = CMMotionManager()

    @IBOutlet var angleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: { (accelData, error) -> Void in
            let angle = atan2(CGFloat(accelData.acceleration.x), CGFloat(accelData.acceleration.y)) * CGFloat(180 / M_PI)
            let moddedAngle = floor(angle) + 180

            self.angleLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/180.0)*moddedAngle);

            
            self.angleLabel.text = "DATA: \(Int(angle))"
        })
    }

    @IBAction func doneTapped(sender: UIButton) {
        let v = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("conclusion") as ConclusionViewController
        self.showViewController(v, sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
