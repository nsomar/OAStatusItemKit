//
//  AppDelegate.swift
//  OAStatusItemKit_Example
//
//  Created by Omar Abdelhafith on 20/01/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Cocoa

import OAStatusItemKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  func applicationDidFinishLaunching(aNotification: NSNotification) {
    NSApplication.sharedApplication().hide(nil)
    
    let statusBarItem = StatusBarItemView(brightStatusImage: NSImage(named: "Icon-bright")!, darkStatusImage: NSImage(named: "Icon-dark")!)
    let _ = StatusBarWindowController(xibName: "Panel", statusItem: statusBarItem)
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
  }


}

