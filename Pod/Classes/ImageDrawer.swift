//
//  ImageDrawer.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 20/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa

struct ImageDrawer {

  /**
   Draws an image in the current graphical context
   
   - parameter image: image to draw
   - parameter rect:  rect to draw the image in
   */
  static func draw(image image: NSImage, inRect rect: NSRect) {
    image.drawAtPoint(
      imageDrawingPoint(forImageSize: image.size, inRect: rect),
      fromRect: NSZeroRect,
      operation: .CompositeSourceOver,
      fraction: 1.0)
  }
  
  /**
   The point at where to draw the image
   */
  static func imageDrawingPoint(forImageSize imageSize: NSSize, inRect rect: NSRect) -> NSPoint {
    let iconX = roundf(Float(NSWidth(rect) - imageSize.width) / 2.0)
    let iconY = roundf(Float(NSHeight(rect) - imageSize.height) / 2.0)
    return NSMakePoint(CGFloat(iconX), CGFloat(iconY))
  }

}
