//
//  StatusBarWindowController.swift
//  MarkdownSharer
//
//  Created by Omar Abdelhafith on 07/12/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Cocoa


/**
 Class responsible for displaying and placing the main status bar panel view
 */
class StatusBarWindowController: NSWindowController, StatusBarViewPresenter {
  
  // MARK: - Properties
  
  /**
   Sets/Gets the window size for the displayed panel
  */
  var windowSize: NSSize?
  
  /**
   Sets/Gets the window placement, defaults to status bar item center
  */
  var windowPlacement = StatusWindowPlacement.StatusBarItemCenter
  
  /**
   Sets/Gets the visibility of the panel
  */
  var visible: Bool = false {
    didSet {
      if visible {
        openWindow()
      } else {
        closeWindow()
      }
    }
  }
  
  /**
  The status bar item view
  */
  private let statusBarItemView: StatusBarItemView
  
  // MARK: - Initializers

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
    statusBarItemView = statusItem
    
    let window = self.dynamicType.createWindow()
    
    window.contentView?.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    
    self.dynamicType.pin(view, inWindow: window);
    
    super.init(window: window)
    window.delegate = self
    
    statusItem.clickHandler = { isHighlighted in
      self.visible = isHighlighted
    }
    
  }
  
  /**
   Method not available
   */
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  /**
   Opens the window and displays it inplace
   */
  private func openWindow() {
    
    guard
      let screen = NSScreen.screens()?.first ,
      let window = window
      else { return }
    
    NSApp.activateIgnoringOtherApps(false)
    window.makeKeyAndOrderFront(nil)
    
    let frame =
    windowPlacement.rect(forWindow: window,
      withSize: actualWindowSize(),
      statusBarItemRect: statusBarItemView.statusBarRect,
      inScreen: screen)
  
    window.alphaValue = 0
    window.setFrame(frame, display: true)
    
    performWithAnimation {
      window.animator().alphaValue = 1
      window.setFrame(frame, display: true)
    }
  }
  
  /**
   Hides and closes the window
   */
  private func closeWindow() {
    statusBarItemView.isHighlighted = false
    
    guard let window = self.window else { return }
    
    performWithAnimation { window.animator().alphaValue = 0 }
    
    performAfter(0.2) { window.orderOut(nil) }
  }
  
  // MARK: - Events
  
  private func actualWindowSize() -> NSSize {
    guard let size = windowSize ?? window?.frame.size else {
      fatalError("The windowSize is not set and cannot infer the size from the window passed (have you set any constraint)")
    }
    
    return size
  }
  
  // MARK: - Private
  
  private func performAfter(delay: Double, closure: () -> ()) {
    dispatch_after(dispatch_walltime(nil, Int64(Double(NSEC_PER_SEC) * delay)), dispatch_get_main_queue()) {
      closure()
    }
  }
  
  private func performWithAnimation(closure: () -> ()) {
    NSAnimationContext.beginGrouping()
    NSAnimationContext.currentContext().duration = 0.1
    closure()
    NSAnimationContext.endGrouping()
  }
  
  private class func createWindow() -> NSWindow {
    let window = StatusPanel.create()
    window.acceptsMouseMovedEvents = true
    window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.PopUpMenuWindowLevelKey))
    window.orderOut(nil)
    
    return window
  }
  
  private class func pin(view: NSView, inWindow window: NSWindow?) {
    
    window?.contentView?.addConstraints(
      NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v]-0-|",
        options: NSLayoutFormatOptions(rawValue: 0),
        metrics: nil,
        views: ["v": view]))
    
    window?.contentView?.addConstraints(
      NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v]-0-|",
        options: NSLayoutFormatOptions(rawValue: 0),
        metrics: nil,
        views: ["v": view]))
  }
  
}

extension StatusBarWindowController: NSWindowDelegate {
  
  func windowDidResignKey(notification: NSNotification) {
    self.closeWindow()
  }
  
  func windowWillClose(notification: NSNotification) {
    self.closeWindow()
  }
  
  func windowDidResignMain(notification: NSNotification) {
    self.closeWindow()
  }
}