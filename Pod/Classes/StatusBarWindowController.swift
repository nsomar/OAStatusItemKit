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
  var windowPlacement = StatusWindowPlacement.statusBarItemCenter
  
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
  fileprivate let statusBarItemView: StatusBarItemView
  
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
    
    let window = type(of: self).createWindow()
    
    window.contentView?.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    
    type(of: self).pin(view, inWindow: window);
    
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
  fileprivate func openWindow() {
    
    guard
	  let screen = NSScreen.screens.first,
      let window = window
      else { return }
    
    NSApp.activate(ignoringOtherApps: false)
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
  fileprivate func closeWindow() {
    statusBarItemView.isHighlighted = false
    
    guard let window = self.window else { return }
    
    performWithAnimation { window.animator().alphaValue = 0 }
    
    performAfter(0.2) { window.orderOut(nil) }
  }
  
  // MARK: - Events
  
  fileprivate func actualWindowSize() -> NSSize {
    guard let size = windowSize ?? window?.frame.size else {
      fatalError("The windowSize is not set and cannot infer the size from the window passed (have you set any constraint)")
    }
    
    return size
  }
  
  // MARK: - Private
  
  fileprivate func performAfter(_ delay: Double, closure: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
      closure()
    }
  }
  
  fileprivate func performWithAnimation(_ closure: () -> ()) {
    NSAnimationContext.beginGrouping()
    NSAnimationContext.current.duration = 0.1
    closure()
    NSAnimationContext.endGrouping()
  }
  
  fileprivate class func createWindow() -> NSWindow {
    let window = StatusPanel.create()
    window.acceptsMouseMovedEvents = true
    window.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(CGWindowLevelKey.popUpMenuWindow)))
    window.orderOut(nil)
    
    return window
  }
  
  fileprivate class func pin(_ view: NSView, inWindow window: NSWindow?) {
    
    window?.contentView?.addConstraints(
      NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v]-0-|",
        options: NSLayoutConstraint.FormatOptions(rawValue: 0),
        metrics: nil,
        views: ["v": view]))
    
    window?.contentView?.addConstraints(
      NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v]-0-|",
        options: NSLayoutConstraint.FormatOptions(rawValue: 0),
        metrics: nil,
        views: ["v": view]))
  }
  
}

extension StatusBarWindowController: NSWindowDelegate {
  
  func windowDidResignKey(_ notification: Notification) {
    self.closeWindow()
  }
  
  func windowWillClose(_ notification: Notification) {
    self.closeWindow()
  }
  
  func windowDidResignMain(_ notification: Notification) {
    self.closeWindow()
  }
}
