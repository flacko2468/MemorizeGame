//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Rishi Ganeshan on 9/4/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published
    private var model: MemoryGame<String>
    
    init(theme: Theme) {
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        var emojis = theme.emojis
        emojis.shuffle()
        let data = try! JSONEncoder().encode(theme)
        print(data.utf8!)
        return MemoryGame<String>(name: theme.name, numberOfPairsOfCards: theme.numberOfPairs, color: Color(theme.color)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var numberOfPairsOfCards: Int {
        model.numberOfPairsOfCards
    }
    
    var color: Color {
        model.color
    }
    
    var name: String {
        model.name
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
    
    func newGame(new: MemoryGame<String>) {
        self.model = new
    }
}


