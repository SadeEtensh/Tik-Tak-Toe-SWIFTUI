//
//  ContentView.swift
//  XsAndOs
//
//  Created by Sade on 17/04/2023.
//

import SwiftUI

struct StartView: View {
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    var body: some View {
        VStack {
            Picker("Select Game", selection: $gameType){
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Two Sharing Device").tag(GameType.singe)
                Text("Challenge Your Device").tag(GameType.bot)
                Text("Challenge a friend ").tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
            //.accentColor(.primary)
            Text(gameType.description).padding()
            VStack {
                switch gameType {
                case .singe:
                    VStack{
                        TextField("Your Name", text: $yourName)
                        TextField("Opponent Name", text: $opponentName)
                    }
                case .bot:
                    TextField("Your Name", text: $yourName)
                case .peer:
                    EmptyView()
                case .undetermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            if gameType != .peer {
                Button("Start Game") {
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undetermined ||
                    gameType == .bot && yourName.isEmpty ||
                    gameType == .singe &&
                    (yourName.isEmpty && opponentName.isEmpty)
                )
                Image("LaunchScreen")
            }
            Spacer()
                
        }
        .padding()
        .navigationTitle("Tic-Tac-Toe")
        .fullScreenCover(isPresented: $startGame, content: {
            GameView()
        })
        .inNavigationStack()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
