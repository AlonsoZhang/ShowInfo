//
//  Window.swift
//  ShowInfo
//
//  Created by Alonso on 2017/8/17.
//  Copyright © 2017年 Alonso. All rights reserved.
//

import Cocoa

class Window: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.backgroundColor = NSColor.clear
        window?.isOpaque = true
        window?.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.floatingWindow)))
        //window?.level =  NSSubmenuWindowLevel
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
}
