//
//  ViewController.swift
//  ShowInfo
//
//  Created by Alonso on 2017/8/17.
//  Copyright © 2017年 Alonso. All rights reserved.
//

import Cocoa

class ViewController: NSViewController{

    @IBOutlet var myMenu: NSMenu!
    @IBOutlet weak var showinfo: NSTextField!
    var ConfigPlist:NSDictionary?
    lazy var font = NSFont()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let file = Bundle.main.path(forResource:"Config", ofType: "plist")
        ConfigPlist = NSDictionary(contentsOfFile: file!)
        showinfo.stringValue = ConfigPlist?["ShowInfo"] as! String
        showinfo.textColor = NSColor.red
        let size = ConfigPlist?["Fontsize"] as! NSNumber
        showinfo.font = NSFont(name: "Menlo", size: CGFloat(size.floatValue))
    }
    
    override func rightMouseDown(with event: NSEvent) {
        let eventLocation = event.locationInWindow
        let center = showinfo.convert(eventLocation, from: nil)
        self.myMenu.popUp(positioning: nil, at: center, in: self.view)
    }
    
    @IBAction func ChangeColor(_ sender: NSMenuItem) {
        let colorpanel = NSColorPanel.shared
        colorpanel.setAction(#selector(changeTextColor(_:)))
        colorpanel.setTarget(self)
        colorpanel.orderFront(nil)
    }
    
    @objc func changeTextColor(_ sender: NSColorPanel){
        let color = sender.color;
        showinfo.textColor = color
    }
    
    @IBAction func ChangeFont(_ sender: NSMenuItem) {
        let fontManager = NSFontManager.shared
        fontManager.target = self
        fontManager.action = #selector(changeTextFont(_:))
        fontManager.orderFrontFontPanel(self)
    }
    
    @objc func changeTextFont(_ sender: NSFontManager){
        font = sender.convert(showinfo.font!)
        print(font)
        showinfo.font = font
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

