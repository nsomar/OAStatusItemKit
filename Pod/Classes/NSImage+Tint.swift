//
//  NSImage+Tint.swift
//  MarkdownSharer
//
//  Created by Omar Abdelhafith on 14/12/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Cocoa


extension NSImage {

  /**
   Return a copy of the image tinted with a color
   
   - parameter color: The color to tint the image
   
   - returns: a tinted copy of the image
   */
  func imageTinted(withColor color: NSColor) -> NSImage {
    let newImage = self.copy()
    newImage.lockFocus()
    color.set()
    
    let imageRect = NSMakeRect(0, 0, newImage.size.width, newImage.size.height)
    NSRectFillUsingOperation(imageRect, .CompositeSourceAtop)
    newImage.unlockFocus()
    
    return newImage as! NSImage
  }
  
}