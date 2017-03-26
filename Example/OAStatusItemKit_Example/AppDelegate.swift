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
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    NSApplication.shared().hide(nil)
    
    let statusBarItem = StatusBarItemView(brightStatusImage: NSImage(named: "Icon-bright")!, darkStatusImage: NSImage(named: "Icon-dark")!)

    
    // Uncomment this to display the view in a window
    // StatusBarWindowStyle.Window(.StatusBarItemCenter)
    // .createPresenter(withXibName: "Panel", statusItem: statusBarItem)
    
    
    // Uncomment this to display the window with a specific size
    // StatusBarWindowStyle.WindowWithSize(.StatusBarItemCenter, NSSize(width: 400, height: 400))
    // .createPresenter(withXibName: "Panel", statusItem: statusBarItem)
    
    
    StatusBarWindowStyle.popup.createPresenter(withXibName: "Panel", statusItem: statusBarItem)
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}

