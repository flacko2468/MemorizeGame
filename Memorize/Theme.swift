//
//  Theme.swift
//  Memorize
//
//  Created by Rishi Ganeshan on 28/4/21.
//

import SwiftUI

class Theme: Codable, Identifiable, ObservableObject {
    var name: String
    var emojis: [String]
    var color: UIColor.RGB
    var numberOfPairs: Int {
        get {
            emojis.count
        }
    }
    
//    enum CodingKeys: CodingKey {
//        case name, emojis, color, numberOfPairs
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(name, forKey: .name)
//        try container.encode(emojis, forKey: .emojis)
//
//        try container.encode(color, forKey: .color)
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        name = try container.decode(String.self, forKey: .name)
//        emojis = try container.decode([String].self, forKey: .emojis)
//
//        color = try container.decode(UIColor.RGB.self, forKey: .color)
//    }
    
    init(name: String, emojis: [String], color: UIColor.RGB) {
        self.name = name
        self.emojis = emojis
        self.color = color
    }
}
