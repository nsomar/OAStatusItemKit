//
//  TestHelper.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 20/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa

@testable import OAStatusItemKit


struct MockStatusBarInterface: StatusBarInterface {
  var isDarkInterface: Bool
  var statusBarHeight: CGFloat
}

class DummyImage: NSImage {
  
  var tintedImage: NSImage?
  var drawPoint: NSPoint?
  
  convenience init(size: NSSize, tintedImage: NSImage) {
    self.init(size: size)
    self.tintedImage = tintedImage
  }
  
  override func imageTinted(withColor color: NSColor) -> NSImage {
    return tintedImage!
  }

  override func drawAtPoint(point: NSPoint, fromRect: NSRect, operation op: NSCompositingOperation, fraction delta: CGFloat) {
    drawPoint = point
  }
}

class DummyWindow: NSWindow {
  convenience init(frame: CGRect) {
    self.init()
    self.contentView = DummyView(fittingSize: frame.size)
  }
}

class DummyView: NSView {
  var __fittingSize: NSSize? = NSZeroSize
  
  convenience init(fittingSize: NSSize) {
    self.init()
    self.__fittingSize = fittingSize
  }
  
  override var fittingSize: NSSize {
    get {
      return __fittingSize!
    }
  }
}

class DummyScreen: NSScreen {
  var __frame: NSRect? = CGRectZero
  
  convenience init(frame: CGRect) {
    self.init()
    self.__frame = frame
  }
  
  override var frame: NSRect {
    get {
      return __frame!
    }
  }
}
