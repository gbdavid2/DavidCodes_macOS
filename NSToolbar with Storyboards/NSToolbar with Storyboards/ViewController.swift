//
//  ViewController.swift
//  MyOSXApp
//
//  Created by David Garces on 25/06/2015.
//  Copyright © 2015 David Garces. All rights reserved.
//

import Cocoa

 class ViewController: NSViewController {
    
    @IBOutlet weak var myLabel: NSTextField!
 
    override  func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override  var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
     func updateMyLabelText(newText: String){
        myLabel.stringValue = newText
    }


}

