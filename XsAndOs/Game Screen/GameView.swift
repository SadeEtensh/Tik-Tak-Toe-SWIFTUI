//
//  GameView.swift
//  XsAndOs
//
//  Created by Sade on 17/04/2023.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Hello, Hello!")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Ende Game") {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Tik-Tak-Toe")
        .inNavigationStack()
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
