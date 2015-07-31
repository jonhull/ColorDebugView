//
//  ViewController.swift
//  ColorDebugViewExample
//
//  Created by Jonathan Hull on 7/30/15.
//  Copyright © 2015 Jonathan Hull. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var debugView: ColorDebugView!
    
    @IBAction func animateHit(sender: UIButton) {
        UIView.animateWithDuration(2.0, animations: {
            self.debugView.transform = CGAffineTransformMakeScale(1.5, 1.5)
        }, completion: { flag in
            UIView.animateWithDuration(2.0, animations: {
                self.debugView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            }, completion: { flag in
                UIView.animateWithDuration(2.0, animations: {
                    self.debugView.transform = CGAffineTransformIdentity
                })
            })
        })
        
    }


}

