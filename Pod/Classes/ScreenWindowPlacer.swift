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
  
  private func xPos(windowWidth: CGFloat, inScreen screen: NSScreen,
    placement: StatusWindowPlacement) -> CGFloat {
      
      let screenWidth = screen.frame.size.width
      switch placement {
      case .ScreenTopLeft:
        fallthrough
      case .ScreenMiddleLeft:
        fallthrough
      case .ScreenBottomLeft:
        return defaultXMargin
        
      case .ScreenTopCenter:
        fallthrough
      case .ScreenMiddleCenter:
        fallthrough
      case .ScreenBottomCenter:
        return (screenWidth - windowWidth) / 2.0
        
      case .ScreenTopRight:
        fallthrough
      case .ScreenMiddleRight:
        fallthrough
      case .ScreenBottomRight:
        return screenWidth - windowWidth - defaultXMargin
        
      default:
        return 0
      }
  }
  
  private func yPos(windowHeight: CGFloat, inScreen screen: NSScreen,
    statusBarItemRect: NSRect,
    placement: StatusWindowPlacement) -> CGFloat {
      
      let maxYPossible = NSMinY(statusBarItemRect)
      
      switch placement {
      case .ScreenBottomLeft:
        fallthrough
      case .ScreenBottomCenter:
        fallthrough
      case .ScreenBottomRight:
        return defaultXMargin
        
      case .ScreenTopLeft:
        fallthrough
      case .ScreenTopCenter:
        fallthrough
      case .ScreenTopRight:
        return maxYPossible - windowHeight
        
      case .ScreenMiddleLeft:
        fallthrough
      case .ScreenMiddleCenter:
        fallthrough
      case .ScreenMiddleRight:
        return (maxYPossible - windowHeight) / 2.0
        
      default:
        return 0
      }
  }
}
