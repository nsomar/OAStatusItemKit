//
//  StatusBarInterface.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 20/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa


/**
 *  Status bar interface utility
 */
protocol StatusBarInterface {
  
  /**
   *  return true if the status bar is in dark theme
   */
  var isDarkInterface: Bool { get }
  
  /**
   *  return the height of the status bar
   */
  var statusBarHeight: CGFloat { get }
}


class StatusBarUtilities: StatusBarInterface {
  
  /// Return true if the status ber is in dark theme
  var isDarkInterface: Bool {
    get {
      return UserDefaults.standard.string(forKey: "AppleInterfaceStyle") == "Dark"
    }
  }
  
  /// Return the height of the status bar
  var statusBarHeight: CGFloat {
    get {
      return NSStatusBar.system().thickness
    }
  }
  
}
