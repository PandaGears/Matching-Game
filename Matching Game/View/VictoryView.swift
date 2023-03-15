//
//  VictoryView.swift
//  Matching Game
//
//  Created by Tamara Radloff on 2023/03/15.
//

import SwiftUI

struct VictoryView: View {
    @State var score1: Int
    @State var score2: Int
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Text("Congratulations!").font(.system(size: 40, weight: .bold))
                    Text(score1 > score2 ? "Player 1 Wins!" : "Player 2 Wins!").font(.system(size: 26, weight: .bold))
                    Form {
                        HStack {
                            Text(score1 > score2 ? "Player 1 Score " : "Player 2 Score " + "👑: ")
                            Spacer()
                            Text(String(score1 > score2 ? score1 : score2))
                        }
                        HStack {
                            Text(score1 < score2 ? "Player 1 Score: " : "Player 2 Score: ")
                            Spacer()
                            Text(String(score1 < score2 ? score1 : score2))
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .foregroundColor(Color.black)
                    .frame(height: 150)
                    Spacer()
                    NavigationLink(destination: CardsView()) {
                        Text("Restart")
                            .font(.system(size: 26, weight: .bold))
                            .navigationBarBackButtonHidden(true)
                    }.navigationBarBackButtonHidden(true)
                        .foregroundColor(.black)
                    Spacer()
                }
            }
        }
    }
}

struct VictoryView_Previews: PreviewProvider {
    static var previews: some View {
        VictoryView(score1: 50, score2: 60)
    }
}
