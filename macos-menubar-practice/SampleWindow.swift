//
//  SampleWindow.swift
//  macos-menubar-practice
//
//  Created by soudegesu on 2022/01/18.
//

import Foundation
import AppKit

class SampleWindow: NSWindow {
  
  override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
    
    super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
    
    self.toolbar = .myToolbar
  }
}


class SampleWindow2: NSWindow {

  override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
    
    super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
    
    self.toolbar = .groupToolbar
  }

}
