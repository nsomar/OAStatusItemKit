//
//  StatusBarImages.swift
//  MarkdownSharer
//
//  Created by Omar Abdelhafith on 19/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa


struct StatusBarImages {
  
  /// Images used
  let brightImage: NSImage
  let darkImage: NSImage?
  
  /// Get/Set the image highligh status
  var isHighlighted = false
  
  /// The current image size
  var imagesSize: NSSize {
    get { return image.size }
  }
  
  /// Get the current image used
  var image: NSImage {
    get {
      if statusBarInterface.isDarkInterface {
        return tintedDarkImage()
      } else {
        return tintedBrightImage()
      }
    }
  }
  
  private let statusBarInterface: StatusBarInterface
  
  // MARK:- Initializers
  
  /**
  Initialize with a single image
  
  - parameter image: Image to use
  - parameter statusBarInterface   Status bar interface helper to use
  */
  init(image: NSImage,
    statusBarInterface: StatusBarInterface = StatusBarUtilities()) {
      
      self.statusBarInterface = statusBarInterface
      self.brightImage = image
      self.darkImage = nil
  }
  
  /**
   Initialize with 2 images
   
   - parameter brightImage:         Image to use in bright status bar theme
   - parameter darkImage:           Image to use in dark status bar theme
   - parameter statusBarInterface   Status bar interface helper to use
   */
  init(brightImage: NSImage, darkImage: NSImage,
    statusBarInterface: StatusBarInterface = StatusBarUtilities()) {
      
      self.statusBarInterface = statusBarInterface
      self.brightImage = brightImage
      self.darkImage = darkImage
  }
  
  /**
   Draw the current image in the current drawing context
   
   - parameter rect: the rect representing the size of the status bar item view
   */
  func drawImage(inRect rect: NSRect) {
    ImageDrawer.draw(image: image, inRect: rect)
  }
  
  // MARK:- Private
  
  /**
  Returns the bright image if not highlighted.
  If highlighted, return the darkImage or a tinted bright image
  */
  func tintedBrightImage() -> NSImage {
    if isHighlighted {
      return darkImage ?? brightImage.imageTinted(withColor: NSColor.whiteColor())
    } else {
      return brightImage
    }
  }
  
  /**
   Returns the dark image or a tinted bright image
   */
  func tintedDarkImage() -> NSImage {
    return darkImage ?? brightImage.imageTinted(withColor: NSColor.whiteColor())
  }
  
}
