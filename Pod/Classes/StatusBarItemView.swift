//
//  StatusBarItemView.swift
//  MarkdownSharer
//
//  Created by Omar Abdelhafith on 07/12/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Cocoa


/**
 Class representing a status bar item view
 */
public class StatusBarItemView: NSView {
  
  /**
   The status bar images
   */
  var statusBarImages: StatusBarImages
  
  /**
   Status Item to use in mac status bar
   */
  var statusItem: NSStatusItem
  
  /**
   Click handler called when the status bar item is clicked
   */
  public var clickHandler: ((isHighlighted: Bool) -> ())?
  
  /**
   Sets/Gets the highlighted status of the status bar item
   */
  public var isHighlighted: Bool = false {
    didSet {
      statusBarImages.isHighlighted = isHighlighted
      needsDisplay = true
    }
  }
  
  /**
   Gets/Sets the status bar item view
   The status bar item height is always the height of the mac status bar
   */
  public var itemWidth: CGFloat {
    didSet {
      let itemHeight = NSStatusBar.systemStatusBar().thickness
      self.frame = NSRect(x: 0.0, y: 0.0, width: itemWidth, height: itemHeight)
    }
  }
  
  /**
   The status bar absolute rect
   */
  var statusBarRect: NSRect {
    return window?.convertRectToScreen(frame) ?? NSZeroRect
  }
  
  // MARK: - Initializers
  
  /**
  Initializes a status bar item view with 2 images
  
  - parameter brightStatusImage: Image to use when the status bar is in bright mode
  - parameter darkStatusImage:   Image to use when the status bar is in dark mode
  */
  public convenience init(brightStatusImage: NSImage, darkStatusImage: NSImage) {
    self.init(statusBarImages: StatusBarImages(brightImage: brightStatusImage, darkImage: darkStatusImage))
  }
  
  /**
   Initializes a status bar item view with a single image
   
   - parameter statusImage: Image to use when the status bar is in bright mode
   */
  public convenience init(statusImage: NSImage) {
    self.init(statusBarImages: StatusBarImages(image: statusImage))
  }
  
  /**
   Initializes a status bar item view with a status bar object
   
   - parameter statusBarImages:     status bar images to use
   - parameter statusBarInterface:  status bar interface wrapper to use
   */
  init(statusBarImages: StatusBarImages,
    statusBarInterface: StatusBarInterface = StatusBarUtilities()) {
      
      self.statusBarImages = statusBarImages
      self.statusItem = StatusBarItemView.createStatusItem(NSVariableStatusItemLength)
      
      self.itemWidth = statusBarImages.imagesSize.width + 8
      
      let rect = StatusBarItemView.rect(withWidth: itemWidth, statusBarInterface: statusBarInterface)
      super.init(frame: rect)
      
      statusItem.view = self
  }
  
  /**
   Method not avaialble
   */
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Events
  
  override public func drawRect(dirtyRect: NSRect) {
    statusItem.drawStatusBarBackgroundInRect(dirtyRect, withHighlight: isHighlighted)
    statusBarImages.drawImage(inRect: bounds)
  }
  
  override public func mouseDown(theEvent: NSEvent) {
    isHighlighted = !isHighlighted
    clickHandler?(isHighlighted: isHighlighted)
  }
  
  // MARK: - Static helpers
  
  private static func createStatusItem(length: CGFloat) -> NSStatusItem {
    return NSStatusBar.systemStatusBar().statusItemWithLength(length)
  }
  
  private static func rect(withWidth width: CGFloat, statusBarInterface: StatusBarInterface) -> NSRect {
    return NSRect(x: 0.0, y: 0.0, width: width,
      height: statusBarInterface.statusBarHeight)
  }
}
