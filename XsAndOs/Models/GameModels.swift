//
//  GameModels.swift
//  XsAndOs
//
//  Created by Sade on 17/04/2023.
//

import Foundation


enum GameType {
    case singe, bot, peer, undetermined
    
    var description: String {
        switch self {
        case .singe:
            return "Share your iPhone/iPad and Play against a friend."
        case .bot:
            return "Play against this iPhone/iPad."
        case .peer:
            return "Invite someone near you who has this app to play."
        case .undetermined:
            return ""
        }
    }
}
