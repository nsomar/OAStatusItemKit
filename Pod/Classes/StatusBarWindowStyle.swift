//
//  ShowIt.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 24/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa

/**
 Enum that controls the style of presenting the view
 */
public enum StatusBarWindowStyle {
  /**
   Present the view in a a popover
   */
  case Popup
  
  /**
   Present the view in a custom window
   
   - parameter StatusWindowPlacement: Window placement type
   */
  case Window(StatusWindowPlacement)
  
  /**
   Present the view in a custom window
   
   - parameter StatusWindowPlacement: Window placement type
   - parameter NSSize:                The size to display the window
   */
  case WindowWithSize(StatusWindowPlacement, NSSize)
}


public extension StatusBarWindowStyle {
  
  /**
   Initializes a status bar window controller
   
   - parameter xibName:    The xib name to load
   - parameter statusItem: The status bar item view to add to mac status bar
   
   - returns: a status bar controller
   */
  public func createPresenter(withXibName xibName: String, statusItem: StatusBarItemView) -> StatusBarViewPresenter {
    return self.createPresenter(withView: BundleLoading.load(xibName), statusItem: statusItem)
  }
  
  /**
   Initializes a status bar window controller
   
   - parameter viewController:  The view controller to display when the status bar item is clicked
   
   If the view controller adhere to StatusBarViewControllerType then the status view presenter will be set
   - parameter statusItem:      The status bar item view to add to mac status bar
   
   - returns: a status bar controller
   
   
   */
  public func createPresenter(withViewController viewController: NSViewController, statusItem: StatusBarItemView) -> StatusBarViewPresenter {
    let presenter = createPresenter(withView: viewController.view, statusItem: statusItem)
    
    if let viewController = viewController as? StatusBarViewControllerType {
      viewController.statusViewPresenter = presenter
    }
    
    return presenter
  }
  
  /**
   Initializes a status bar window controller
   
   - parameter view:       The view to display when the status bar item is clicked
   - parameter statusItem: The status bar item view to add to mac status bar
   
   - returns: a status bar controller
   */
  public func createPresenter(withView view: NSView, statusItem: StatusBarItemView) -> StatusBarViewPresenter {
    switch self {
      
    case .Popup:
      return StatusBarPopupPresenter(view: view, statusItem: statusItem)
      
    case let .Window(windowPlacement):
      let windowController = StatusBarWindowController(view: view, statusItem: statusItem)
      windowController.windowPlacement = windowPlacement
      return windowController
      
    case let .WindowWithSize(windowPlacement, size):
      let windowController = StatusBarWindowController(view: view, statusItem: statusItem)
      windowController.windowPlacement = windowPlacement
      windowController.windowSize = size
      return windowController
    }
  }
  
}