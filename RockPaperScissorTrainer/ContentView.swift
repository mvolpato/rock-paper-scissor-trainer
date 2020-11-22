//
//  ContentView.swift
//  RockPaperScissorTrainer
//
//  Created by Michele Volpato on 21/11/2020.
//

import SwiftUI

struct MoveImage: View {
    let move: Move

    var body: some View {
        Text(move.emoji)
            .font(.largeTitle)
    }
}

struct ResultColor: View {
    let result: Bool?

    var body: some View {
        if let result = result {
            result ? Color.green.opacity(0.5) : Color.red.opacity(0.5)
        } else {
            Color.white
        }
    }
}

struct ContentView: View {
    @State private var chosenMove = Move.randomMove()
    @State private var shouldWin = Bool.random()

    @State private var score = 0
    @State private var latestCorrect: Bool? = nil

    var body: some View {
        ZStack {
            ResultColor(result: latestCorrect)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Your goal is to \(shouldWin ? "win" : "lose") against")
                    .font(.title2)
                MoveImage(move: chosenMove)
                Spacer()
                Text("Your choice:")
                    .font(.headline)
                HStack {
                    ForEach(Move.allCases, id: \.self) { move in
                        Button(action: {
                            checkAnswer(move: move)
                        }) {
                            MoveImage(move: move)
                        }
                    }
                }
                Spacer()
                Text("Score: \(score)")
                if let latestScore = latestCorrect {
                    Text("Latest attempt was \(latestScore ? "correct" : "wrong").")
                        .font(.footnote)
                } else {
                    Text("")
                }
            }
        }
    }

    private func checkAnswer(move: Move) {
        let correct = shouldWin ? move.winAgainst(chosenMove) : move.loseAgainst(chosenMove)
        if correct {
            latestCorrect = true
            score += 1
        } else {
            latestCorrect = false
            score -= 1
        }
        chosenMove = Move.randomMove()
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
