//
//  AppDelegate.swift
//  macos-menubar-practice
//
//  Created by soudegesu on 2022/01/18.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

  var window: NSWindow!
  var window2: NSWindow!

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Create the SwiftUI view that provides the window contents.
    let contentView = ContentView()

    NSToolbar.myToolbar.delegate = self
    NSToolbar.groupToolbar.delegate = self
    
    // Create the window and set the content view.
    window = SampleWindow(
        contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
        backing: .buffered, defer: false)
    
    window.isReleasedWhenClosed = false
    window.center()
    window.setFrameAutosaveName("Main Window")
    window.contentView = NSHostingView(rootView: contentView)
    window.makeKeyAndOrderFront(nil)
    
    window2 = SampleWindow2(
        contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
        backing: .buffered, defer: false)
    
    window2.isReleasedWhenClosed = false
    window2.center()
    window2.setFrameAutosaveName("Sub Window")
    window2.contentView = NSHostingView(rootView: contentView)
    window2.makeKeyAndOrderFront(nil)
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}

