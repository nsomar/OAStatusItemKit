//
//  WindowPlacer.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 20/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa


/**
 *  Window placer protocol
 */
protocol WindowPlacer {
  /**
   Place a window
   
   - parameter window:            window to place
   - parameter windowSize:        window size
   - parameter statusBarItemRect: status bar item rect
   - parameter screen:            screen
   */
  func  rect(forWindow window: NSWindow, withSize windowSize: CGSize?,
    statusBarItemRect: NSRect, inScreen screen: NSScreen) -> NSRect
}


let minimumXMargin: CGFloat = 8.0
let defaultXMargin: CGFloat = 12.0

extension StatusWindowPlacement: WindowPlacer {
  
  func  rect(forWindow window: NSWindow, withSize windowSize: CGSize?,
    statusBarItemRect: NSRect, inScreen screen: NSScreen) -> NSRect {
      
      var rect = NSZeroRect
      
      switch self {
        
      case .StatusBarItemCenter:
        fallthrough
      case .StatusBarItemLeft:
        fallthrough
      case .StatusBarItemRight:
        rect = StatusBarItemCenterPlacer()
          .rect(forWindow: window,
            withSize: windowSize,
            statusBarItemRect: statusBarItemRect,
            placement:  self)
        break
        
      case .ScreenMiddleLeft:
        fallthrough
      case .ScreenMiddleCenter:
        fallthrough
      case .ScreenMiddleRight:
        fallthrough
      case .ScreenTopLeft:
        fallthrough
      case .ScreenTopRight:
        fallthrough
      case .ScreenTopCenter:
        fallthrough
      case .ScreenBottomLeft:
        fallthrough
      case .ScreenBottomRight:
        fallthrough
      case .ScreenBottomCenter:
        rect = ScreenWindowPlacer()
          .rect(forWindow: window,
            withSize: windowSize,
            statusBarItemRect: statusBarItemRect,
            inScreen: screen,
            placement:  self)
        break
      }
      
      return adjustedRectForBorders(rect, screen: screen)
  }
  
  func adjustedRectForBorders(windowRect: NSRect, screen: NSScreen) -> NSRect {
    let screenRect = screen.frame
    
    if (NSMaxX(windowRect) > (NSMaxX(screenRect) - minimumXMargin)) {
      var fixedRect = windowRect
      fixedRect.origin.x -= NSMaxX(windowRect) - (NSMaxX(screenRect) - defaultXMargin)
      return fixedRect
    } else {
      return windowRect
    }
  }
}
