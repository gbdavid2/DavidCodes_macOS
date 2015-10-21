//
//  AppDelegate.swift
//  BeddyButlerHelperApp
//
//  Created by David Garces on 20/09/2015.
//  Copyright © 2015 David Garces. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        NSDistributedNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
}

