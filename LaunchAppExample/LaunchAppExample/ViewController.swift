//
//  ViewController.swift
//  LaunchAppExample
//
//  Created by David Garces on 21/10/2015.
//  Copyright © 2015 David Codes. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var resultTextField: NSTextField!
    @IBOutlet weak var appPathTextField: NSTextField!
    @IBOutlet weak var bundleIdentifierTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func launchApp(sender: AnyObject) {
        
        // Check if main app is already running; if yes, do nothing and terminate helper app
        var isAlreadyRunning = false
        
        let running = NSWorkspace.sharedWorkspace().runningApplications
        
        for app in running {
            if app.bundleIdentifier == bundleIdentifierTextField.stringValue {
                isAlreadyRunning = true
            }
        }
        
        if !isAlreadyRunning {
            
            let path = NSWorkspace.sharedWorkspace().absolutePathForAppBundleWithIdentifier(bundleIdentifierTextField.stringValue)
        
            let result = NSWorkspace.sharedWorkspace().launchApplication(path!)
            
            appPathTextField.stringValue = path!
            
            resultTextField.stringValue = result ? "App launched!" : "App didn't launch :("
        } else {
            resultTextField.stringValue = "App is already running"
        }

    }

}

