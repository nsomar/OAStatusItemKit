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
  case screenMiddleLeft
  
  /**
   *  Place the window in the middle center of the screen
   */
  case screenMiddleCenter
  
  /**
   *  Place the window in the middle right of the screen
   */
  case screenMiddleRight
  
  
  /**
   *  Place the window in the top left of the screen
   */
  case screenTopLeft
  
  /**
   *  Place the window in the top right of the screen
   */
  case screenTopRight
  
  /**
   *  Place the window in the top center of the screen
   */
  case screenTopCenter
  
  /**
   *  Place the window in the bottom left of the screen
   */
  case screenBottomLeft
  
  /**
   *  Place the window in the bottom right of the screen
   */
  case screenBottomRight
  
  /**
   *  Place the window in the bottom center of the screen
   */
  case screenBottomCenter
  
  
  /**
   *  Place the window in the bellow the status bar item, horizontally centered to the item
   */
  case statusBarItemCenter
  
  /**
   *  Place the window in the bellow the status bar item, left alligned to the item
   */
  case statusBarItemLeft
  
  /**
   *  Place the window in the bellow the status bar item, right alligned to the item
   */
  case statusBarItemRight
  
}
