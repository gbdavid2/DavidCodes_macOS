//
//  ViewController.swift
//  LaunchAtLoginExample
//
//  Created by David Garces on 23/10/2015.
//  Copyright © 2015 David Codes. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var resultTextField: NSTextField!
    
    let fileManager = NSFileManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultTextField.stringValue = ""
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func launchAtLogin(sender: AnyObject) {
        
        if let theButton = sender as? NSButton {
            let runStartup = Bool(theButton.integerValue)
            // Turn on launch at login
            if runStartup {
                createPlist()
            } else {
                deletePlistFile()
            }
            
        }
    }
  
    func getPlistPath() -> NSURL {
        
        //Create file manager instance
        let URLs = fileManager.URLsForDirectory(NSSearchPathDirectory.LibraryDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        
        let documentURL = URLs[0]
        let reviewedURL = documentURL.URLByAppendingPathComponent("LaunchAgents")
        let fileURL = reviewedURL.URLByAppendingPathComponent("uk.davidcodes.LaunchAtLoginExample.plist")
    
        return fileURL
        
    }
    
    func createPlistFile(data: NSData) {
        let theURL = getPlistPath()
        deletePlistFile()
        fileManager.createFileAtPath(theURL.path!, contents: data, attributes: nil)
    }
    
    func deletePlistFile() {
        do {
            let theURL = getPlistPath()
            if fileManager.fileExistsAtPath(theURL.path!) {
                try fileManager.removeItemAtURL(theURL)
                
                resultTextField.stringValue = "File deleted successfully from launch agents"
            }
        } catch {
            let resultMessage = "Error while deleting the plist file"
            resultTextField.stringValue = resultMessage
            NSLog(resultMessage)
        }
    }
    
    func createPlist() {
        
        // NSApplication.ur
        
        var plistDictionary: Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
        
        // Create Key values
        let label = "uk.davidcodes.LaunchAtLoginExample"
        let programArguments = ["/Applications/LaunchAtLoginExample.app/Contents/MacOS/LaunchAtLoginExample"]
        let processType = "Interactive"
        let runAtLoad = true
        let keepAlive = false // This key specifies whether your daemon launches on-demand or must always be running. It is recommended that you design your daemon to be launched on-demand.
        
        // Assign Key values to keys
        plistDictionary["Label"] = label
        plistDictionary["ProgramArguments"] = programArguments
        plistDictionary["ProcessType"] = processType
        plistDictionary["RunAtLoad"] = runAtLoad
        plistDictionary["KeepAlive"] = keepAlive
        
        do {
            let data = try NSPropertyListSerialization.dataWithPropertyList(plistDictionary, format: NSPropertyListFormat.XMLFormat_v1_0, options: NSPropertyListWriteOptions.init())
            
           createPlistFile(data)
            
            resultTextField.stringValue = "File created successfully in launch agents"
            
        } catch {
            let resultMessage = "Error while creating agent file"
            resultTextField.stringValue = resultMessage
            NSLog(resultMessage)
        }
    }

}

