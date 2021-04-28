//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rishi Ganeshan on 9/4/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let store = ThemeStore()
            ThemeChooser().environmentObject(store)
            //EmojiMemoryGameView(viewModel: game)
        }
    }
}
