//
//  ConclusionViewController.swift
//  Scolio
//
//  Created by Robert S Mozayeni on 9/14/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit

class ConclusionViewController: UIViewController {

    @IBOutlet var resultsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var count = 0
        let c = Human.currentHuman
        
        if (fabs(c.topAngle!) >= 10.0) {
            count++
        }
        
        if (fabs(c.bottomAngle!) >= 10.0) {
            count++
        }
        if (c.hasChronicHeadaches!){
            count++
        }
        if (c.hasBackNeckKneePain!){
            count++
        }
        if (c.hasBreathingIssues!){
            count++
        }
        if (c.hasPainRadiatingFromSinglePoint!){
            count++
        }
        

        self.resultsLabel.text = (count >= 3 ) ? "There is a chance you may have, or may be at risk for, scoliosis." : "You do not too many obvious signs of scoliosis. Nonetheless, Scolio recommends you still see a doctor for anything you are uncertain about. "

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
