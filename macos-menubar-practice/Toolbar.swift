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
}

extension NSToolbar {
    static let myToolbar: NSToolbar = {
        let toolbar = NSToolbar(identifier: "MyToolbar")
        toolbar.displayMode = .iconOnly
        return toolbar
    }()
}

extension AppDelegate: NSToolbarDelegate {
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [.today]
    }

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [.today]
    }

    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        switch itemIdentifier {
        case NSToolbarItem.Identifier.today:
            let button = NSButton(title: "今日", target: nil, action: #selector(printToday))
            return cutomToolbarItem(itemIdentifier: .today, itemContent: button)
        default:
            return nil
        }
    }

    @objc private func printToday(_ sender: NSButton) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        print(df.string(from: Date()))
    }
}

func cutomToolbarItem(itemIdentifier: NSToolbarItem.Identifier, itemContent: NSButton) -> NSToolbarItem? {
    let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
    toolbarItem.view = itemContent
    return toolbarItem
}
