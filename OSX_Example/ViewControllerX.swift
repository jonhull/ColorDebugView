//
//  ViewController.swift
//  OSX_Example
//
//  Created by Jonathan Hull on 7/30/15.
//  Copyright © 2015 Jonathan Hull. All rights reserved.
//

import Cocoa

class ViewControllerX: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var debugView: ColorDebugView!
    
    @IBAction func animateHit(sender: NSButton) {
        
        NSAnimationContext.beginGrouping()
        let ctx = NSAnimationContext.currentContext()
        ctx.duration = 2.0
        NSAnimationContext.runAnimationGroup({ ctx in
            self.debugView.animator().frameRotation = 90.0
        }, completionHandler: {
            NSAnimationContext.runAnimationGroup({ ctx in
                ctx.duration = 2.0
                self.debugView.animator().frameRotation = 0.0
            }, completionHandler: {})
        })
        NSAnimationContext.endGrouping()
        
    }
    

}
