//
//  CardView.swift
//  Matching Game
//
//  Created by Tamara Radloff on 2023/03/15.
//

import AVFoundation
import SwiftUI

struct CardView: View {
    
    @ObservedObject var card: Card
    
    @Binding var matchedCards: [Card]
    
    @Binding var flippededCards: [Card]
    @Binding var score1: Int
    @Binding var score2: Int
    @Binding var player1Turn: Bool
    @Binding var player2Turn: Bool
    @State var refresh: Bool = false
    @Binding var isCompleted: Bool

    var body: some View {
            Group {
                if card.isFaceUp {
                    card.image
                        .resizable()
                        .frame(width: 40, height: 55)
                } else if matchedCards.contains(where: { $0.image == card.image }) {
                    withAnimation(Animation.linear.delay(1)) {
                        card.image
                            .resizable()
                            .frame(width: 40, height: 55)
                            .hidden()
                    }
                } else {
                    card.faceDownCard
                        .resizable()
                        .frame(width: 40, height: 55)
                        .onTapGesture {
                            if flippededCards.count < 2 {
                                if flippededCards.count == 0 {
                                    card.turnCard()
                                    AudioServicesPlaySystemSound(1104)
                                    flippededCards.append(card)
                                } else if flippededCards.count == 1 {
                                    card.turnCard()
                                    flippededCards.append(card)
                                    if !checkMatch(cardOne: flippededCards[0], cardTwo: flippededCards[1]) {
                                        AudioServicesPlaySystemSound(1104)
                                        withAnimation(Animation.linear.delay(1)) {
                                            for usedCard in flippededCards {
                                                usedCard.turnCard()
                                            }
                                            player1Turn.toggle()
                                            player2Turn.toggle()
                                        }
                                    } else {
                                        for usedCard in flippededCards {
                                            matchedCards.append(usedCard)
                                            if player1Turn {
                                                score1 += 5
                                            } else {
                                                score2 += 5
                                            }
                                            AudioServicesPlaySystemSound(1031)
                                           if matchedCards.count == 54 {
                                                isCompleted = true
                                            }
                                        }
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                            flippededCards.removeAll()
                                        }
                                    
                                }
                            }
                        }
                }
            }
    }
    
    func update() {
       refresh.toggle()
    }
}
