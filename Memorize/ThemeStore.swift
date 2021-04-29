//
//  ThemeStorer.swift
//  Memorize
//
//  Created by Rishi Ganeshan on 27/4/21.
//

import SwiftUI
import Combine

class ThemeStore: ObservableObject, Identifiable
{
    
    @Published var themes: [Theme] = []
    
    init() {
        themes.append(Theme(name: "Halloween", emojis: ["🎃", "🥸", "🤡", "👹", "👻", "👽"], color: UIColor.orange.rgb))
        themes.append(Theme(name: "Christmas", emojis: ["🎄", "🎁", "❄️", "☃️", "🎅"], color: UIColor.green.rgb))
        themes.append(Theme(name: "Flags", emojis: ["🇦🇺", "🇦🇼", "🇦🇽", "🇦🇿", "🇧🇦", "🇧🇧", "🇧🇩", "🇧🇪", "🇧🇫", "🇧🇬", "🇧🇭" ,"🇧🇮"], color: UIColor.blue.rgb))
        themes.append(Theme(name: "Fruit", emojis: ["🍇", "🍈", "🍉", "🍊"], color: UIColor.purple.rgb))
        themes.append(Theme(name: "Animals", emojis: ["🐮", "🐷", "🐯", "🐶", "🐵"], color: UIColor.yellow.rgb))
        themes.append(Theme(name: "COVID", emojis: ["💉", "🩹", "🧑‍🔬", "🧑‍⚕️"], color: UIColor.red.rgb))
    }

}




