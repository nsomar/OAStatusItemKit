//
//  BundleLoadable.swift
//  OAStatusItemKit
//
//  Created by Omar Abdelhafith on 21/01/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Cocoa


/**
 Class that helps loading an object from a nib
 */
class BundleLoading<T> {
  
  /**
   Load a view from a nib
   
   - parameter xibName: the nib name
   */
  static func load(_ xibName: String) -> T {
    return self.loadFromBundle(Bundle.main, nibName: xibName)!
  }
  
  fileprivate static func loadFromBundle(_ bundle: Bundle, nibName: String) -> T? {
    var objects: NSArray = []
    Bundle.main.loadNibNamed(nibName, owner: nil, topLevelObjects: &objects)
    return objects.flatMap { $0 as? T }.first
  }
  
}
