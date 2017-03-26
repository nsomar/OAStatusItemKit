//
//  ScreenWindowPlacer.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 21/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa


/**
 Class thats responsible for placing a window relative to the screen passed
 */
class ScreenWindowPlacer {
  
  /**
   return the rect for the passed arguments
   
   - parameter window:            the window to place
   - parameter windowSize:        the window size
   - parameter statusBarItemRect: the status menu item rect
   - parameter screen:            the screen
   - parameter placement:         placement type
   */
  func  rect(forWindow window: NSWindow, withSize windowSize: CGSize?,
    statusBarItemRect: NSRect, inScreen screen: NSScreen,
    placement: StatusWindowPlacement) -> NSRect {
      
      let windowSize = windowSize ?? window.contentView!.fittingSize
      
      let point =
      NSPoint(
        x: xPos(windowSize.width, inScreen: screen, placement: placement),
        y: yPos(windowSize.height, inScreen: screen, statusBarItemRect: statusBarItemRect, placement: placement))
      
      return NSRect(origin: point, size: windowSize)
  }
  
  fileprivate func xPos(_ windowWidth: CGFloat, inScreen screen: NSScreen,
    placement: StatusWindowPlacement) -> CGFloat {
      
      let screenWidth = screen.frame.size.width
      switch placement {
      case .screenTopLeft:
        fallthrough
      case .screenMiddleLeft:
        fallthrough
      case .screenBottomLeft:
        return defaultXMargin
        
      case .screenTopCenter:
        fallthrough
      case .screenMiddleCenter:
        fallthrough
      case .screenBottomCenter:
        return (screenWidth - windowWidth) / 2.0
        
      case .screenTopRight:
        fallthrough
      case .screenMiddleRight:
        fallthrough
      case .screenBottomRight:
        return screenWidth - windowWidth - defaultXMargin
        
      default:
        return 0
      }
  }
  
  fileprivate func yPos(_ windowHeight: CGFloat, inScreen screen: NSScreen,
    statusBarItemRect: NSRect,
    placement: StatusWindowPlacement) -> CGFloat {
      
      let maxYPossible = NSMinY(statusBarItemRect)
      
      switch placement {
      case .screenBottomLeft:
        fallthrough
      case .screenBottomCenter:
        fallthrough
      case .screenBottomRight:
        return defaultXMargin
        
      case .screenTopLeft:
        fallthrough
      case .screenTopCenter:
        fallthrough
      case .screenTopRight:
        return maxYPossible - windowHeight
        
      case .screenMiddleLeft:
        fallthrough
      case .screenMiddleCenter:
        fallthrough
      case .screenMiddleRight:
        return (maxYPossible - windowHeight) / 2.0
        
      default:
        return 0
      }
  }
}
