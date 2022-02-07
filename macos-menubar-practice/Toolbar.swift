//
//  Toolbar.swift
//  macos-menubar-practice
//
//  Created by soudegesu on 2022/01/18.
//

import Foundation
import AppKit

extension NSToolbarItem.Identifier {
    static let today = NSToolbarItem.Identifier(rawValue: "Today")
    static let group = NSToolbarItem.Identifier(rawValue: "Group")
    static let groupA = NSToolbarItem.Identifier(rawValue: "GroupA")
    static let groupB = NSToolbarItem.Identifier(rawValue: "GroupB")
}

extension NSToolbar {
    static let myToolbar: NSToolbar = {
        let toolbar = NSToolbar(identifier: "MyToolbar")
        toolbar.displayMode = .iconOnly
        return toolbar
    }()
    
  static let groupToolbar: NSToolbar = {
    let toolbar = NSToolbar(identifier: "GroupToolbar")
    toolbar.displayMode = .iconOnly
    return toolbar
  }()
}

extension AppDelegate: NSToolbarDelegate {
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
      switch toolbar {
      case .groupToolbar:
        return [.group]
      default:
        return [.today]
      }
    }

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
      switch toolbar {
      case .groupToolbar:
        return [.group]
      case .myToolbar:
        return [.today]
      default:
        return []
      }
    }

    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        switch itemIdentifier {
        case NSToolbarItem.Identifier.today:
            let button = NSButton(title: "今日", target: nil, action: #selector(printToday))
            return cutomToolbarItem(itemIdentifier: .today, itemContent: button)
        case NSToolbarItem.Identifier.group:
          let group = NSToolbarItemGroup(itemIdentifier: .group,
                                         titles: ["a", "b"],
                                         selectionMode: .selectOne,
                                         labels: ["a", "b"],
                                         target: self,
                                         action: #selector(groupSelected))
          group.selectedIndex = 0
          return group
        default:
            return nil
        }
    }

    @objc private func printToday(_ sender: NSButton) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        print(df.string(from: Date()))
    }
  
  @objc private func groupSelected(_ sender: NSToolbarItemGroup) {
    debugPrint("Selected: \(sender.selectedIndex)")
  }
}

func cutomToolbarItem(itemIdentifier: NSToolbarItem.Identifier, itemContent: NSButton) -> NSToolbarItem? {
    let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
    toolbarItem.view = itemContent
    return toolbarItem
}
