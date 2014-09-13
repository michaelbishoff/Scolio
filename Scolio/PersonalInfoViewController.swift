//
//  PersonalInfoViewController.swift
//  Scolio
//
//  Created by Robert S Mozayeni on 9/13/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var biologicalSexSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        ageTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueTapped(sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let qvc = sb.instantiateViewControllerWithIdentifier("qvc") as QuestionsViewController
        self.showViewController(qvc, sender: self)
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
