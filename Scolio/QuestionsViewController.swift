//
//  QuestionsViewController.swift
//  Scolio
//
//  Created by Robert S Mozayeni on 9/13/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var questionsTableView: UITableView!
    
    let symptoms = ["Chronic headache", "Back, neck, or knee pain", "Breathing issues", "Pain radiating from a single point"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionsTableView.delegate = self
        self.questionsTableView.dataSource = self
        
        self.questionsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countElements(symptoms)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = questionsTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = symptoms[indexPath.row]
        
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.questionsTableView.cellForRowAtIndexPath(indexPath)
        println(cell!.accessoryType == .None)
        cell?.accessoryType = (cell?.accessoryType == .None) ? .Checkmark : .None
        
    }
    

}
