//
//  Bla.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 24/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa


/**
 Class responsible for displaying the view in a popover
 */
class StatusBarPopupPresenter: StatusBarViewPresenter {
  
  /**
   The view to present
   */
  let view: NSView
  
  /**
   The popover that presents the view
   */
  fileprivate let popover = NSPopover()
  
  /**
   The status bar item view
   */
  let statusItem: StatusBarItemView
  
  /**
   The event monitor to help the popover when clicking outside of it
   */
  fileprivate var eventMonitor: EventMonitor?
  
  /**
   Initializes a status bar window controller
   
   - parameter xibName:    The xib name to load
   - parameter statusItem: The status bar item view to add to mac status bar
   
   - returns: a status bar controller
   */
  convenience required init(xibName: String, statusItem: StatusBarItemView) {
    let view: NSView = BundleLoading.load(xibName)
    self.init(view: view, statusItem: statusItem)
  }
  
  /**
   Initializes a status bar window controller
   
   - parameter view:       The view to display when the status bar item is clicked
   - parameter statusItem: The status bar item view to add to mac status bar
   
   - returns: a status bar controller
   */
  required init(view: NSView, statusItem: StatusBarItemView) {
    self.view = view
    self.statusItem = statusItem
    
    self.popover.contentViewController = StatusPanelViewController(view: view)
    setEvents()
  }
  
  internal var visible: Bool {
    
    get {
      return statusItem.isHighlighted
    }
    
    set {
      if newValue == visible { return }
      statusItem.isHighlighted = newValue
      
      if newValue {
        showPopup()
      } else {
        hidePopup()
      }
    }
  }
  
  // MARK: - Private
  
  fileprivate func setEvents() {
    
    self.statusItem.clickHandler = { isHighlighted in
      isHighlighted ? self.showPopup() : self.hidePopup()
    }
    
    eventMonitor = EventMonitor(mask: [NSEvent.EventTypeMask.leftMouseDown, NSEvent.EventTypeMask.rightMouseDown]) { [unowned self] event in
      if self.popover.isShown {
        self.statusItem.isHighlighted = false
        self.hidePopup()
      }
    }
    
    eventMonitor?.start()
  }
  
  fileprivate func showPopup () {
    popover.show(relativeTo: statusItem.bounds, of: statusItem, preferredEdge: NSRectEdge.minY)
    eventMonitor?.start()
  }
  
  fileprivate func hidePopup () {
    self.popover.performClose(nil)
    eventMonitor?.stop()
  }
  
}


/**
 View controller to be placed in the popover
 */
class StatusPanelViewController: NSViewController {
  init?(view: NSView) {
    super.init(nibName: nil, bundle: nil)
    self.view = view
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
