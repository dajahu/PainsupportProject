//
//  BodyViewController.swift
//  Body
//
//  Created by Arnolds on 08/03/16.
//  Copyright © 2016 ATTR. All rights reserved.
//

import UIKit

@IBDesignable class BodyView: UIView{
    var front:      Body!
    var back:       Body!
    var rightside:  Body!
    var leftside:   Body!
    
    var lastPoint           = CGPoint.zero
    var red:        CGFloat = 0.0
    var green:      CGFloat = 195
    var blue:       CGFloat = 189
    var brushWidth: CGFloat = 10.0
    var opacity:    CGFloat = 0.5
    
    var swiped = false
    
    override func drawRect(rect: CGRect) {
        
    }
    
    override var contentScaleFactor:CGFloat{
        set{
            super.contentScaleFactor        = newValue
            front.contentScaleFactor        = super.contentScaleFactor
            back.contentScaleFactor         = super.contentScaleFactor
            rightside.contentScaleFactor    = super.contentScaleFactor
            leftside.contentScaleFactor     = super.contentScaleFactor
        }
        get{
            return super.contentScaleFactor
        }
    }
    
    // Constructor for initiating default values like background color
    override init(frame: CGRect) {        
        // Body parts
        front        = Body(name : "front");
        back         = Body(name : "back");
        rightside    = Body(name : "side");
        leftside     = Body(name : "side");
        
        super.init(frame: front.frame.integral)
        self.opaque = false
        
        self.addSubview(front)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.locationInView(self)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        let current:Body = front
        // 1
        var size = self.bounds.size
        size.width = round(size.width)
        size.height = round(size.height)
        
        // This causes drawing fail, event if it's same size as above
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        current.imageview.image?.drawInRect(CGRect(x: 0, y: 0, width:size.width, height:size.height))
        
        // 2
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        
        // 3
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, brushWidth)
        CGContextSetRGBStrokeColor(context, red, green, blue, 1.0)
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        
        // 4
        CGContextStrokePath(context)
        
        // 5
        current.imageview.image = UIGraphicsGetImageFromCurrentImageContext()
        current.imageview.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.locationInView(self)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }

    
}
