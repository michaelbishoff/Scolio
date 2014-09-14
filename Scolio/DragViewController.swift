//
//  DragViewController.swift
//  Scolio
//
//  Created by Robert S Mozayeni on 9/13/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit

class DragViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    @IBOutlet var topLeft: DragNodeView!
    @IBOutlet var topRight: DragNodeView!
    @IBOutlet var bottomLeft: DragNodeView!
    @IBOutlet var bottomRight: DragNodeView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueTapped(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(picker, animated: true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        let v = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("dsp") as DrawSpineViewController
        v.takenImage = image
        self.showViewController(v, sender: self)
    }


}

class DragView: UIView {
    @IBOutlet var topLeft: DragNodeView!
    @IBOutlet var topRight: DragNodeView!
    @IBOutlet var bottomLeft: DragNodeView!
    @IBOutlet var bottomRight: DragNodeView!

    
    var topPair: (DragNodeView!, DragNodeView!) {// ¯\_(ツ)_/¯
        return (topLeft.frame.origin.x <= topRight.frame.origin.x) ? (topLeft, topRight) : (topRight, topLeft)
    }
    
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextTranslateCTM(context, 0.0, rect.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        
        CGContextSetShouldAntialias(context, true)
        CGContextSetLineWidth(context, 4)
        CGContextSetRGBStrokeColor(context, 0.7, 0.7, 0.7, 1.0)
        CGContextMoveToPoint(context, self.topLeft.center.x, self.frame.height-self.topLeft.center.y)
        CGContextAddLineToPoint(context, self.topRight.center.x, self.frame.height-self.topRight.center.y)
        CGContextDrawPath(context, kCGPathStroke)
        
        println("Angle: \(DragNodeView.angle(self.topLeft, self.topRight))")
        CGContextMoveToPoint(context, self.bottomLeft.center.x, self.frame.height-self.bottomLeft.center.y)
        CGContextAddLineToPoint(context, self.bottomRight.center.x, self.frame.height-self.bottomRight.center.y)
        CGContextDrawPath(context, kCGPathStroke)
        
        CGContextRestoreGState(context)
    
    }
}


class DragNodeView: UIView {
    
    class func angle(a: DragNodeView, _ b: DragNodeView) -> CGFloat{
        let dx = b.frame.origin.x - a.frame.origin.x
        let dy = a.frame.origin.y - b.frame.origin.y
        let ang = atan((dy/dx)) * CGFloat(180.0/3.14)
        return ang
    }
    
    func realCenter() -> CGPoint {
        let standardAnchor = CGPoint(x: 0.5, y: 0.5)
        let anchor = self.layer.anchorPoint
        
        let diff = CGPoint(x: standardAnchor.x-anchor.x, y: standardAnchor.y-anchor.y)
        return diff
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override init() {
        super.init()
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.backgroundColor = UIColor(red: 115/255, green: 173/255, blue: 186/255, alpha: 1)
        self.layer.cornerRadius = frame.height/2
        self.clipsToBounds = true
        
        self.enableDragging()
        
    }
    
    //    override func drawRect(rect: CGRect)
    //    {
    //        // Drawing code
    //    }
    
    
}

infix operator + { associativity left precedence 140 }
func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x+right.x, y: left.y+right.y)
}
