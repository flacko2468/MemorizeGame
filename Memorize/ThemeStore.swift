//
//  ThemeStorer.swift
//  Memorize
//
//  Created by Rishi Ganeshan on 27/4/21.
//

import SwiftUI
import Combine

class ThemeStore: ObservableObject
{
    
    @Published var themes: [Theme] =
        [Theme(name: "Halloween", emojis: ["🎃", "🥸", "🤡", "👹", "👻", "👽"], color: UIColor.orange.rgb),
         Theme(name: "Christmas", emojis: ["🎄", "🎁", "❄️", "☃️", "🎅"], color: UIColor.green.rgb),
         Theme(name: "Flags", emojis: ["🇦🇺", "🇦🇼", "🇦🇽", "🇦🇿", "🇧🇦", "🇧🇧", "🇧🇩", "🇧🇪", "🇧🇫", "🇧🇬", "🇧🇭" ,"🇧🇮"], color: UIColor.blue.rgb),
         Theme(name: "Fruit", emojis: ["🍇", "🍈", "🍉", "🍊"], color: UIColor.purple.rgb),
         Theme(name: "Animals", emojis: ["🐮", "🐷", "🐯", "🐶", "🐵"], color: UIColor.yellow.rgb),
         Theme(name: "COVID", emojis: ["💉", "🩹", "🧑‍🔬", "🧑‍⚕️"], color: UIColor.red.rgb)]

}




