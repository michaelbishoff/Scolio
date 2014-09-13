//
//  DragViewController.swift
//  Scolio
//
//  Created by Robert S Mozayeni on 9/13/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit

class DragViewController: UIViewController {
    @IBOutlet var topLeft: DragNodeView!
    @IBOutlet var topRight: DragNodeView!
    @IBOutlet var bottomLeft: DragNodeView!
    @IBOutlet var bottomRight: DragNodeView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

class DragView: UIView {
    @IBOutlet var topLeft: DragNodeView!
    @IBOutlet var topRight: DragNodeView!
    @IBOutlet var bottomLeft: DragNodeView!
    @IBOutlet var bottomRight: DragNodeView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override func drawRect(rect: CGRect) {
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        CGContextSaveGState(context);
//        
//        CGContextTranslateCTM(context, 0.0, rect.size.height);
//        CGContextScaleCTM(context, 1.0, -1.0);
//        
//        CGContextSetShouldAntialias(context, YES);
//        CGContextSetLineWidth(context, 1.0f);
//        CGContextSetRGBStrokeColor(context, 0.7, 0.7, 0.7, 1.0);
//        
//        CGContextMoveToPoint(context, rect.size.width/2, rect.size.height/2);
//        CGContextAddLineToPoint(context, self.touchedPoint.x, self.touchedPoint.y);
//        CGContextDrawPath(context, kCGPathStroke); 
//        
//        CGContextRestoreGState(context);

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
        
        CGContextMoveToPoint(context, self.bottomLeft.center.x, self.frame.height-self.bottomLeft.center.y)
        CGContextAddLineToPoint(context, self.bottomRight.center.x, self.frame.height-self.bottomRight.center.y)
        CGContextDrawPath(context, kCGPathStroke)
        
        CGContextRestoreGState(context)
    
    }
}


class DragNodeView: UIView {
    
    
    
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
        self.backgroundColor = .blueColor()
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
