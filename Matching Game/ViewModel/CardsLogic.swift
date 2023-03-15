//
//  CardsLogic.swift
//  Matching Game
//
//  Created by Tamara Radloff on 2023/03/15.
//

import SwiftUI

class Card: Identifiable, ObservableObject {
    
    var id = UUID()
    @Published var isFaceUp = false
    
    var image: Image
    var detail: String
    let faceDownCard = Image("cover")
    
    init(image: Image, detail: String) {
        self.image = image
        self.detail = detail
    }
    
    func turnCard() {
        self.isFaceUp.toggle()
    }
}
    
    let cardValues: [CardData] = [
        CardData(image: Image("Clubs2"), details: "Black 2"),
        CardData(image: Image("Clubs3"), details: "Black 3"),
        CardData(image: Image("Clubs4"), details: "Black 4"),
        CardData(image: Image("Clubs5"), details: "Black 5"),
        CardData(image: Image("Clubs6"), details: "Black 6"),
        CardData(image: Image("Clubs7"), details: "Black 7"),
        CardData(image: Image("Clubs8"), details: "Black 8"),
        CardData(image: Image("Clubs9"), details: "Black 9"),
        CardData(image: Image("Clubs10"), details: "Black 10"),
        CardData(image: Image("ClubsA"), details: "Black A"),
        CardData(image: Image("ClubsJ"), details: "Black J"),
        CardData(image: Image("ClubsK"), details: "Black K"),
        CardData(image: Image("ClubsQ"), details: "Black Q"),
        CardData(image: Image("Diamonds2"), details: "Red 2"),
        CardData(image: Image("Diamonds3"), details: "Red 3"),
        CardData(image: Image("Diamonds4"), details: "Red 4"),
        CardData(image: Image("Diamonds5"), details: "Red 5"),
        CardData(image: Image("Diamonds6"), details: "Red 6"),
        CardData(image: Image("Diamonds7"), details: "Red 7"),
        CardData(image: Image("Diamonds8"), details: "Red 8"),
        CardData(image: Image("Diamonds9"), details: "Red 9"),
        CardData(image: Image("Diamonds10"), details: "Red 10"),
        CardData(image: Image("DiamondsA"), details: "Red A"),
        CardData(image: Image("DiamondsJ"), details: "Red J"),
        CardData(image: Image("DiamondsK"), details: "Red K"),
        CardData(image: Image("DiamondsQ"), details: "Red Q"),
        CardData(image: Image("Hearts2"), details: "Red 2"),
        CardData(image: Image("Hearts3"), details: "Red 3"),
        CardData(image: Image("Hearts4"), details: "Red 4"),
        CardData(image: Image("Hearts5"), details: "Red 5"),
        CardData(image: Image("Hearts6"), details: "Red 6"),
        CardData(image: Image("Hearts7"), details: "Red 7"),
        CardData(image: Image("Hearts8"), details: "Red 8"),
        CardData(image: Image("Hearts9"), details: "Red 9"),
        CardData(image: Image("Hearts10"), details: "Red 10"),
        CardData(image: Image("HeartsA"), details: "Red A"),
        CardData(image: Image("HeartsJ"), details: "Red J"),
        CardData(image: Image("HeartsK"), details: "Red K"),
        CardData(image: Image("HeartsQ"), details: "Red Q"),
        CardData(image: Image("Spades2"), details: "Black 2"),
        CardData(image: Image("Spades3"), details: "Black 3"),
        CardData(image: Image("Spades4"), details: "Black 4"),
        CardData(image: Image("Spades5"), details: "Black 5"),
        CardData(image: Image("Spades6"), details: "Black 6"),
        CardData(image: Image("Spades7"), details: "Black 7"),
        CardData(image: Image("Spades8"), details: "Black 8"),
        CardData(image: Image("Spades9"), details: "Black 9"),
        CardData(image: Image("Spades10"), details: "Black 10"),
        CardData(image: Image("SpadesA"), details: "Black A"),
        CardData(image: Image("SpadesJ"), details: "Black J"),
        CardData(image: Image("SpadesK"), details: "Black K"),
        CardData(image: Image("SpadesQ"), details: "Black Q"),
        CardData(image: Image("JokerRed"), details: "Joker"),
        CardData(image: Image("JokerBlack"), details: "Joker"),
    ]
    
    func createCardList() -> [Card] {
        var cardlist: [Card] = []
        
        for card in cardValues {
            cardlist.append(Card(image: card.image, detail: card.details))
        }
        return cardlist
    }
    
func checkMatch(cardOne: Card, cardTwo: Card) -> Bool{
    if cardOne.detail == cardTwo.detail {
        return true
    } else {
        return false
    }
}
    

