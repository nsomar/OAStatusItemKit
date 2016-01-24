//
//  StatusWindowPlacement.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 20/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Foundation


/**
 Status window placement type
 */
public enum StatusWindowPlacement {
  
  /**
   *  Place the window in the middle left of the screen
   */
  case ScreenMiddleLeft
  
  /**
   *  Place the window in the middle center of the screen
   */
  case ScreenMiddleCenter
  
  /**
   *  Place the window in the middle right of the screen
   */
  case ScreenMiddleRight
  
  
  /**
   *  Place the window in the top left of the screen
   */
  case ScreenTopLeft
  
  /**
   *  Place the window in the top right of the screen
   */
  case ScreenTopRight
  
  /**
   *  Place the window in the top center of the screen
   */
  case ScreenTopCenter
  
  /**
   *  Place the window in the bottom left of the screen
   */
  case ScreenBottomLeft
  
  /**
   *  Place the window in the bottom right of the screen
   */
  case ScreenBottomRight
  
  /**
   *  Place the window in the bottom center of the screen
   */
  case ScreenBottomCenter
  
  
  /**
   *  Place the window in the bellow the status bar item, horizontally centered to the item
   */
  case StatusBarItemCenter
  
  /**
   *  Place the window in the bellow the status bar item, left alligned to the item
   */
  case StatusBarItemLeft
  
  /**
   *  Place the window in the bellow the status bar item, right alligned to the item
   */
  case StatusBarItemRight
  
}
