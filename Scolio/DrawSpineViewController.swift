//
//  DrawSpineViewController.swift
//  Scolio
//
//  Created by Robert S Mozayeni on 9/14/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit

class DrawSpineViewController: UIViewController {

    var takenImage: UIImage?
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var tempImageView: UIImageView!
    
    var mouseSwiped = false
    var lastPoint: CGPoint!
    let brush: CGFloat = 10
    let red: CGFloat = 0/255
    let blue: CGFloat = 0/255
    let green: CGFloat = 0/255
    let opacity: CGFloat = 1.0
    
    var points: [CGPoint] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageView.image = takenImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        points = []
        mainImageView.image = takenImage
        tempImageView.image = UIImage()
        
        mouseSwiped = false
        var touch: UITouch = touches.anyObject() as UITouch
        lastPoint = touch.locationInView(self.view)
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        mouseSwiped = true;
        var touch: UITouch = touches.anyObject() as UITouch
        var currentPoint = touch.locationInView(self.view)
        
        points.append(currentPoint)
        
        UIGraphicsBeginImageContext(self.view.frame.size);
        
        self.tempImageView.image?.drawInRect(CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y)
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound)
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush )
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
        
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.tempImageView.image = UIGraphicsGetImageFromCurrentImageContext();
        self.tempImageView.alpha = opacity
        UIGraphicsEndImageContext();
        
        lastPoint = currentPoint;
    }
    
    //    - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if(!mouseSwiped) {
            UIGraphicsBeginImageContext(self.view.frame.size);
            self.tempImageView.image?.drawInRect(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            CGContextStrokePath(UIGraphicsGetCurrentContext());
            CGContextFlush(UIGraphicsGetCurrentContext());
            self.tempImageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        
        UIGraphicsBeginImageContext(self.mainImageView.frame.size);
        self.mainImageView.image?.drawInRect(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        // Blend mode = 1.0 ?
        self.tempImageView.image?.drawInRect(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        
        
        //    kCGBlendModeNormal = 1.0
        //    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
        //        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
        self.mainImageView.image = UIGraphicsGetImageFromCurrentImageContext();
        self.tempImageView.image = nil;
        UIGraphicsEndImageContext();
        
        
        
        var start_pos = points[0]
        var end_pos = points[points.count - 1]
        var max = points[0]
        
        for var i = 1; i < points.count; i++ {
            if (points[i].x > max.x) {
                max = points[i]
            }
        }
        
        var x_diff = abs(start_pos.x - max.x)
        var y_diff = abs(start_pos.y - max.y)
        
        var theata_rads = atan2(x_diff, y_diff)
        var theata_degrees = theata_rads * (180 / 3.14159)
        
        println("X: \(x_diff)")
        println("Y: \(y_diff)")
        println("Theata: \(theata_degrees)")
        
        if theata_degrees > 10 {
            println("You have Scoliosis")
        }
        
        
        
    }

}
