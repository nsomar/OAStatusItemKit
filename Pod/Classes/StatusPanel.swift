//
//  StatusPanel.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 21/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Foundation

/**
 the main panel class
 */
class StatusPanel: NSPanel {
  
  /**
   Create a new status panel
   */
  class func create() -> StatusPanel {
    let panel = StatusPanel(contentRect: NSRect(x: 0, y: 0, width: 200, height: 200), styleMask: NSNonactivatingPanelMask,
      backing: .buffered, defer: true)
    return panel
  }
 
  override var canBecomeKey: Bool {
    return true
  }
  
}
