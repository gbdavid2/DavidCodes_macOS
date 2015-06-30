//
//  WindowController.swift
//  MyOSXApp
//
//  Created by David Garces on 25/06/2015.
//  Copyright © 2015 David Garces. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    var viewController: ViewController {
        get {
            return self.window!.contentViewController! as! ViewController
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        //viewController.myLabel.stringValue = "boo"
    }
    
    @IBAction func changeText(sender: NSButton) {
        viewController.updateMyLabelText("Button clicked! The value is: \(sender.title)")
    }
    


}
