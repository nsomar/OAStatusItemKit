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
    var loadedObjects = NSArray()
    let loadedObjectsPointer = AutoreleasingUnsafeMutablePointer<NSArray?>(&loadedObjects)
    
    if Bundle.main.loadNibNamed(NSNib.Name(String(describing: self)), owner: nil, topLevelObjects: loadedObjectsPointer) {
        return loadedObjects[0] as? T
    }
    
    return nil

  }
  
}
