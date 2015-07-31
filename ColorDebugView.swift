//
//  ColorDebugView.swift
//  ColorDebugViewExample
//
//  Created by Jonathan Hull on 7/30/15.
//  Copyright © 2015 Jonathan Hull. All rights reserved.
//

import Foundation

#if os(OSX)
    import Cocoa

    @IBDesignable class ColorDebugView:NSView {
        
        @IBInspectable var color:NSColor
        @IBInspectable var isDot:Bool = false
        
        init(){
            color = ColorDebugView.randomColor(0.6)
            super.init(frame: CGRectZero)
        }
        
        override init(frame: CGRect) {
            color = ColorDebugView.randomColor(0.6)
            super.init(frame: frame)
        }
        
        init(frame: CGRect, color:NSColor) {
            self.color = color ?? ColorDebugView.randomColor(0.6)
            super.init(frame: frame)
        }
        
        init(point:CGPoint, side:CGFloat = 64.0, color:NSColor?=nil, dot:Bool = true){
            self.color = color ?? ColorDebugView.randomColor(0.6)
            self.isDot = dot
            super.init(frame: CGRectMake(point.x - side/2.0, point.y - side/2.0, side, side))
        }
        
        
        required init?(coder: NSCoder) {
        color = ColorDebugView.randomColor(0.6)
        super.init(coder: coder)
        }
    
        override func awakeFromNib() {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    
        override var intrinsicContentSize:CGSize {
            return CGSize(width: 64.0, height: 64.0)
        }
        
        override func drawRect(rect: CGRect) {
            color.set()
        
            if isDot{
                NSBezierPath(ovalInRect:self.bounds).fill()
            }else{
                NSBezierPath.fillRect(rect)
            }
            NSColor.blackColor().colorWithAlphaComponent(0.1).set()
                
            let w = self.bounds.size.width
            let h = self.bounds.size.height
            NSBezierPath.fillRect(CGRectMake(CGRectGetMidX(self.bounds)-w/2.0, CGRectGetMidY(self.bounds)-0.5, w, 1.0))
            NSBezierPath.fillRect(CGRectMake(CGRectGetMidX(self.bounds)-0.5, CGRectGetMidY(self.bounds)-h/2.0, 1.0, h))
                
            if w > 6 && h > 6{
                NSColor.blackColor().colorWithAlphaComponent(0.2).set()
                NSBezierPath.fillRect(CGRectMake(CGRectGetMidX(self.bounds)-3.0, CGRectGetMidY(self.bounds)-0.5, 6.0, 1.0))
                NSBezierPath.fillRect(CGRectMake(CGRectGetMidX(self.bounds)-0.5, CGRectGetMidY(self.bounds)-3.0, 1.0, 6.0))
                NSBezierPath.fillRect(CGRectMake(CGRectGetMidX(self.bounds)-0.5, CGRectGetMaxY(self.bounds)-h/8.0, 1.0, h/8.0))
            }
        }
        
        static func randomColor(alpha:CGFloat)->NSColor{
            let randHue:CGFloat = CGFloat(arc4random_uniform(1000))/1000.0
            return NSColor(hue: randHue, saturation: 0.8, brightness: 0.6, alpha: alpha)
        }
        
    }


#else
    
    import UIKit


    @IBDesignable class ColorDebugView:UIView {
        
        @IBInspectable var color:UIColor
        @IBInspectable var isDot:Bool = false
        
        init(){
            color = ColorDebugView.randomColor(0.6)
            super.init(frame: CGRectZero)
        }
        
        override init(frame: CGRect) {
            color = ColorDebugView.randomColor(0.6)
            super.init(frame: frame)
        }
        
        init(frame: CGRect, color:UIColor) {
            self.color = color ?? ColorDebugView.randomColor(0.6)
            super.init(frame: frame)
        }
        
        init(point:CGPoint, side:CGFloat = 64.0, color:UIColor?=nil, dot:Bool = true){
            self.color = color ?? ColorDebugView.randomColor(0.6)
            self.isDot = dot
            super.init(frame: CGRectMake(point.x - side/2.0, point.y - side/2.0, side, side))
        }
        
        required init(coder aDecoder: NSCoder) {
            color = ColorDebugView.randomColor(0.6)
            super.init(coder: aDecoder)
            self.backgroundColor = UIColor.clearColor()
        }
        
        override func awakeFromNib() {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        override func intrinsicContentSize()->CGSize {
            return CGSize(width: 64.0, height: 64.0)
        }
        
        override func drawRect(rect: CGRect) {
            color.set()
            
            if isDot{
                    UIBezierPath(ovalInRect: self.bounds).fill()
            }else{
                    UIBezierPath(rect: rect).fill()
            }
            UIColor.blackColor().colorWithAlphaComponent(0.1).set()
                
            let w = self.bounds.size.width
            let h = self.bounds.size.height
            UIBezierPath(rect:CGRectMake(CGRectGetMidX(self.bounds)-w/2.0, CGRectGetMidY(self.bounds)-0.5, w, 1.0)).fill()
            UIBezierPath(rect:CGRectMake(CGRectGetMidX(self.bounds)-0.5, CGRectGetMidY(self.bounds)-h/2.0, 1.0, h)).fill()
                
            if w > 6 && h > 6{
                UIColor.blackColor().colorWithAlphaComponent(0.2).set()
                UIBezierPath(rect:CGRectMake(CGRectGetMidX(self.bounds)-3.0, CGRectGetMidY(self.bounds)-0.5, 6.0, 1.0)).fill()
                UIBezierPath(rect:CGRectMake(CGRectGetMidX(self.bounds)-0.5, CGRectGetMidY(self.bounds)-3.0, 1.0, 6.0)).fill()
                UIBezierPath(rect:CGRectMake(CGRectGetMidX(self.bounds)-0.5, 0.0, 1.0, h/8.0)).fill()
            }
        }
        
        static func randomColor(alpha:CGFloat)->UIColor{
            let randHue:CGFloat = CGFloat(arc4random_uniform(1000))/1000.0
            return UIColor(hue: randHue, saturation: 0.8, brightness: 0.6, alpha: alpha)
        }
        
    }

#endif

