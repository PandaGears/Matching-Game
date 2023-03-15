//
//  CardData.swift
//  Matching Game
//
//  Created by Tamara Radloff on 2023/03/15.
//

import SwiftUI

class CardData {
    var image: Image
    var details: String
    
    init(image: Image, details: String) {
        self.image = image
        self.details = details
    }
}
