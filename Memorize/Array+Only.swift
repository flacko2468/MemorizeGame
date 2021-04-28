//
//  Array+Only.swift
//  Memorize
//
//  Created by Rishi Ganeshan on 13/4/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
