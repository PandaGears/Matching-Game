//
//  CardsView.swift
//  Matching Game
//
//  Created by Tamara Radloff on 2023/03/15.
//

import SwiftUI

struct CardsView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @State var cardList = createCardList().shuffled()
    @State var matchedCards = [Card]()
    @State var flippedCards = [Card]()
    @State var isComplete = false
    @State var score1: Int = 0
    @State var score2: Int = 0
    @State var player1Turn: Bool = true
    @State var player2Turn: Bool = false
    @State var refresh: Bool = false

    private var sixPartGrid = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    var body: some View {
        NavigationStack{
            ZStack {
                Color.blue
                    .ignoresSafeArea(.all)
                VStack {
                    Text("Match'em Competitive").font(.system(size: 36, weight: .bold))
                    Spacer().frame(height: 30)
                    HStack {
                        
                        Text("Player 1 Score: \(score1)").font(.system(size: 20, weight: .bold)).background(player1Turn ? Color.purple : .clear)
                        Text("|")
                        Text("Player 2 Score: \(score2)").font(.system(size: 20, weight: .bold)).background(player2Turn ? Color.purple : .clear)
                    }
                    LazyVGrid(columns: sixPartGrid,spacing: 5) {
                        ForEach(cardList) { card in
                            CardView(card: card,
                                     matchedCards: $matchedCards,
                                     flippededCards: $flippedCards,
                                     score1: $score1,
                                     score2: $score2,
                                     player1Turn: $player1Turn,
                                     player2Turn: $player2Turn,
                                     isCompleted: $isComplete)
                        }
                    }
                }
                NavigationLink("Hidden finish link", isActive: $isComplete){
                    
                    VictoryView(score1: score1, score2: score2)
                    .navigationBarBackButtonHidden(true)
                }.navigationBarBackButtonHidden(true)
                    .hidden()
            }
            
        }.background(Color.gray.edgesIgnoringSafeArea(.all))
    }
    func update() {
       refresh.toggle()
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
