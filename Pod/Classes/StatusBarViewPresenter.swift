//
//  StatusBarViewPresenter.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 24/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa

public protocol StatusBarViewPresenter {
  
  /**
   Initializes a status bar window controller
   
   - parameter xibName:    The xib name to load
   - parameter statusItem: The status bar item view to add to mac status bar
   
   - returns: a status bar controller
   */
  init(xibName: String, statusItem: StatusBarItemView)
  
  /**
   Initializes a status bar window controller
   
   - parameter view:       The view to display when the status bar item is clicked
   - parameter statusItem: The status bar item view to add to mac status bar
   
   - returns: a status bar controller
   */
  init(view: NSView, statusItem: StatusBarItemView)
  
  /// Sets and gets the visibility of the tool bar window
  var visible: Bool { get set }
  
}


/**
 StatusBarViewControllerType a type that can hold a status view presenter
 */
public protocol StatusBarViewControllerType: AnyObject {
  
  /// The status bar item used
  var statusViewPresenter: StatusBarViewPresenter! { get set }
  
}
