//
//  DisplayImageViewController.swift
//  Scolio
//
//  Created by Robert S Mozayeni on 9/13/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit

class DisplayImageViewController: UIViewController {
    var image: UIImage?
    @IBOutlet var takenImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        takenImageView.image = image
        let d = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("dvc") as DragViewController
        d.view.frame = self.view.frame
        self.addChildViewController(d)
        d.didMoveToParentViewController(self)
        self.view.addSubview(d.view)
        // Do any additional setup after loading the view.
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
