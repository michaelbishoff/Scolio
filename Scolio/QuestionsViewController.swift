//
//  QuestionsViewController.swift
//  Scolio
//
//  Created by Robert S Mozayeni on 9/13/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var chronicBox: M13Checkbox!
    @IBOutlet var backNeckKneeBox: M13Checkbox!
    @IBOutlet var breathingBox: M13Checkbox!
    @IBOutlet var singlePointBox: M13Checkbox!

    override func viewDidLoad() {
        super.viewDidLoad()
        chronicBox.strokeColor = UIColor(red: 115/255, green: 173/255, blue: 186/255, alpha: 1)
        chronicBox.checkColor = UIColor(red: 110/255, green: 163/255, blue: 176/255, alpha: 1)
        
        backNeckKneeBox.strokeColor = UIColor(red: 115/255, green: 173/255, blue: 186/255, alpha: 1)
        backNeckKneeBox.checkColor = UIColor(red: 110/255, green: 163/255, blue: 176/255, alpha: 1)
        
        breathingBox.strokeColor = UIColor(red: 115/255, green: 173/255, blue: 186/255, alpha: 1)
        breathingBox.checkColor = UIColor(red: 110/255, green: 163/255, blue: 176/255, alpha: 1)
        
        singlePointBox.strokeColor = UIColor(red: 115/255, green: 173/255, blue: 186/255, alpha: 1)
        singlePointBox.checkColor = UIColor(red: 110/255, green: 163/255, blue: 176/255, alpha: 1)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueTapped(sender: UIButton) {
        let thisHuman = Human.currentHuman
        
        thisHuman.hasChronicHeadaches = chronicBox.checkState.value == M13CheckboxStateChecked.value
        thisHuman.hasBackNeckKneePain = backNeckKneeBox.checkState.value == M13CheckboxStateChecked.value
        thisHuman.hasBreathingIssues = breathingBox.checkState.value == M13CheckboxStateChecked.value
        thisHuman.hasPainRadiatingFromSinglePoint = singlePointBox.checkState.value == M13CheckboxStateChecked.value
        
        println("\(Human.currentHuman.hasChronicHeadaches) \(Human.currentHuman.hasBackNeckKneePain) \(Human.currentHuman.hasBreathingIssues) \(Human.currentHuman.hasPainRadiatingFromSinglePoint)")
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        let sb = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let dv = sb.instantiateViewControllerWithIdentifier("divc") as DisplayImageViewController
        
        self.showViewController(dv, sender: self)
        dv.image = image
        
    }
    
   
}
