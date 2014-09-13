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
            let angle = atan2(accelData.acceleration.x, accelData.acceleration.y) * 180 / M_PI
            self.angleLabel.text = "DATA: \(angle)"
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
