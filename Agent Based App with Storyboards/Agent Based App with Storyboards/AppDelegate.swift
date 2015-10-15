//
//  AppDelegate.swift
//  Agent Based App with Storyboards
//
//  Created by David Garces on 15/10/2015.
//  Copyright © 2015 David Codes. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    //static  var statusItem: NSStatusItem?
    var menu: NSMenu!
    var statusItem: NSStatusItem?

    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        
        // Make a status bar that has variable length
        // (as opposed to being a standard square size)
        
        // -1 to indicate "variable length"
        self.statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
        
        // Set the text that appears in the menu bar
        self.statusItem!.title = "Star!"
        self.statusItem?.image = NSImage(named: "Star")
        self.statusItem?.image?.size = NSSize(width: 20, height: 18)
        self.statusItem?.length = 70
        // image should be set as tempate so that it changes when the user sets the menu bar to a dark theme
        // TODO: feature disabled for now, this may possibly be the issue to why it is not showing in Nell's mac
        self.statusItem?.image?.template = true
        
        // Set the menu that should appear when the item is clicked
        self.statusItem!.menu = self.menu
        
        // Set if the item should ”
        //change color when clicked
        self.statusItem!.highlightMode = true
        
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func quit(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(nil)
    }


}

