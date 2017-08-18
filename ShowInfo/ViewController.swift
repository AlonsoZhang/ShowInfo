//
//  ViewController.swift
//  ShowInfo
//
//  Created by Alonso on 2017/8/17.
//  Copyright © 2017年 Alonso. All rights reserved.
//

import Cocoa

class ViewController: NSViewController{

    @IBOutlet weak var showinfo: NSTextField!
    var ConfigPlist:NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let file = Bundle.main.path(forResource:"Config", ofType: "plist")
        ConfigPlist = NSDictionary(contentsOfFile: file!)
        showinfo.stringValue = ConfigPlist?["ShowInfo"] as! String
        showinfo.textColor = NSColor.red
        let size = ConfigPlist?["Fontsize"] as! NSNumber
        showinfo.font = NSFont(name: "Menlo", size: CGFloat(size.floatValue))
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

