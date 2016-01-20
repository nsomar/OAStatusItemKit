//
//  StatusBarItemCenterPlacer.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 21/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa


/**
 Class thats responsible for placing a window relative to the status bar item view
 */
class StatusBarItemCenterPlacer {
  
  /**
   return the rect for the passed arguments
   
   - parameter window:            the window to place
   - parameter windowSize:        the window size
   - parameter statusBarItemRect: the status menu item rect
   - parameter placement:         placement type
   */
  func  rect(forWindow window: NSWindow, withSize windowSize: CGSize?,
    statusBarItemRect: NSRect, placement: StatusWindowPlacement) -> NSRect {
      
      let windowSize = windowSize ?? window.contentView!.fittingSize
      let statusRect = self.rectForStatusItem(statusBarItemRect)
      
      let point =
      NSPoint(
        x: xPos(statusRect: statusRect, windowWidth: windowSize.width, placement: placement),
        y: NSMaxY(statusRect) - windowSize.height) 
      
      return NSRect(origin: point, size: windowSize)
  }
  
  private func xPos(statusRect statusRect: NSRect, windowWidth: CGFloat, placement: StatusWindowPlacement) -> CGFloat {
    
    switch placement {
    case .StatusBarItemCenter:
      return NSMidX(statusRect) - windowWidth / 2.0
      
    case .StatusBarItemLeft:
      return NSMaxX(statusRect) - windowWidth + defaultXMargin
      
    case .StatusBarItemRight:
      return NSMinX(statusRect) - defaultXMargin
      
    default:
      return 0
    }
  }
  
  private func rectForStatusItem(statusBarItemRect: NSRect) -> NSRect {
    var statusRect = NSZeroRect
    
    statusRect = statusBarItemRect
    statusRect.origin.y = NSMinY(statusRect) - NSHeight(statusRect)
    
    return statusRect
  }
  
}
